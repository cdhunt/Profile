Import-Module posh-git
Import-Module PowerShellHumanizer
Import-Module NameIt
Import-Module CETWin10Toolkit

. "$PSScriptRoot\Functions\Test-Administrator.ps1"
. "$PSScriptRoot\Functions\AudioSetup.ps1"
. "$PSScriptRoot\Functions\StartPrograms.ps1"
. "$PSScriptRoot\Functions\Maybe.ps1"
. "$PSScriptRoot\Functions\InstallProfileScript.ps1"

. "$PSScriptRoot\ScriptsToProcess\ConsoleTitle.ps1"
. "$PSScriptRoot\ScriptsToProcess\Prompt.ps1"
. "$PSScriptRoot\ScriptsToProcess\SshAgent.ps1"
. "$PSScriptRoot\ScriptsToProcess\SetLocation.ps1"
. "$PSScriptRoot\ScriptsToProcess\ImportChocolateyProfile.ps1"
