function Install-ProfileScript {
    [CmdletBinding()]
    param (
        [switch] $Force
    )

    $moduleLocation = Split-Path (Get-Module -ListAvailable Profile)[0].Path

    If ( -not (Test-Path -Path $profile) -or $Force )
    {

        Copy-Item -Path "$moduleLocation\lib\Microsoft.PowerShell_profile.ps1" -Destination $profile

    }
    else
    {

        Write-Verbose "$Profile already exists."

    }
}

function Test-ProfileScript {
    [CmdletBinding()]
    param ( )

    $moduleLocation = Split-Path (Get-Module -ListAvailable Profile)[0].Path

    If ( Test-Path -Path $profile) {

        $src = Get-FileHash -Path "$moduleLocation\lib\Microsoft.PowerShell_profile.ps1"
        $existing = Get-FileHash -Path $profile

        if ($src.Hash -ne $existing.Hash)
        {
            Write-Warning 'Your profile does not match the source file in the Profile module.'
        }
        else
        {
            Write-Verbose 'Checksums match'
        }

    }
    else
    {
        Write-Warning 'No profile exists.'
    }

}
