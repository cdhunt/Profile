function senn  { Set-DefaultAudioDevice -Name 'Speakers (3- Sennheiser USB headset)' }
function speakers { Set-DefaultAudioDevice -Name 'Speaker/HP (Realtek High Definition Audio)' }
function headphones { Set-DefaultAudioDevice -Name 'Realtek HD Audio 2nd output (Realtek High Definition Audio)' }

function volup {
    param([float]$n = 10 )
    $vol = [float]::Parse((Get-DefaultAudioDeviceVolume).trim('%'))
    Set-DefaultAudioDeviceVolume -Volume ($vol + $n)
    Get-DefaultAudioDeviceVolume
}
function voldown {
    param([float]$n = 10 )
    $vol = [float]::Parse((Get-DefaultAudioDeviceVolume).trim('%'))
    Set-DefaultAudioDeviceVolume -Volume ($vol - $n)
    Get-DefaultAudioDeviceVolume
}

Set-Alias -Name vol -Value Get-DefaultAudioDeviceVolume
Set-Alias -Name mute -Value Set-DefaultAudioDeviceMute