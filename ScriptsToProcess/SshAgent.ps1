<#
.SYNOPSIS
    Start the SshAgent that hosts private key.
.DESCRIPTION
    Start the SshAgent that hosts private key. "$env:USERPROFILE\.ssh"
.NOTES
    Requires the posh-git Module.
#>
Start-SshAgent -Quiet