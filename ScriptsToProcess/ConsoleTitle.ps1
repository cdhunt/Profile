<#
.SYNOPSIS
    Commands to set up the Console Title
.DESCRIPTION
    This selects a random session name using NameIt and adds additional text if running under
    the context of Administrator or a Git repository.
.NOTES
    Requires NameIt and posh-git Modules as well as the Test-Administrator funciton.
#>

if (Test-Administrator) {
    $SessionTitle = 'Administrator: PowerShell [' + $SessionTitleName + ']'
}
else
{
    $SessionTitle = 'PowerShell [' + $SessionTitleName + ']'
}

$Host.UI.RawUI.WindowTitle = $SessionTitle
$Global:GitPromptSettings.EnableWindowTitle = "posh~git ~ [$($SessionTitleName)]"