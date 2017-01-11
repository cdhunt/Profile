<#
.SYNOPSIS
    Test if the current PowerShell session running in the Administrator context.
.DESCRIPTION
    Test if the current PowerShell session running in the Administrator context.
.EXAMPLE
    PS C:\> Test-Administrator
    Explanation of what the example does
.OUTPUTS
    Output (if any)
.NOTES
    General notes
#>
function Test-Administrator {
    return ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
}