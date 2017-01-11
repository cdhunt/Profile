function Start-Dev {
    Get-ChildItem "$env:USERPROFILE\Desktop\startup\dev\" -File | ForEach-Object { & $_.FullName }
}

function Start-Default {
    Get-ChildItem "$env:USERPROFILE\Desktop\startup\default\" -File | ForEach-Object { & $_.FullName }
}

function Start-Vpn {
    & "$env:USERPROFILE\Desktop\startup\Cisco AnyConnect Secure Mobility Client.lnk"
}

function Start-Rdc {
    & "$env:USERPROFILE\Desktop\startup\EasyConnect.lnk"
}
