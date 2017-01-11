<#
.SYNOPSIS
    Set the current location to C:\Temp.
.DESCRIPTION
    Set the current location to C:\Temp. Create the folder if it doesn't exist.
#>

If ( -not (Test-Path -Path 'C:\Temp') )
{

    New-Item -Path 'C:\' -Name 'Temp'
}

Set-Location 'C:\Temp'