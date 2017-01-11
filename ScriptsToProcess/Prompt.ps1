<#
.SYNOPSIS
    Format the prompt.
.DESCRIPTION
    This prompt configuration displays the SesstionTitleName assinged in ConsoleTitle.ps1 and also adjusts the color
    based on Test-Administrator.
.NOTES
    Requires NameIt and posh-git Modules as well as the Test-Administrator funciton.
#>
function global:prompt
{
    Write-Host ''
    if (Test-Administrator) {
        Write-Host "[$($ProfileVariables.SessionTitleName)] " -NoNewline -ForegroundColor Yellow
    } else {
        Write-Host "[$($ProfileVariables.SessionTitleName)] " -NoNewline -ForegroundColor DarkGray
    }
    Write-Host ($pwd.ProviderPath) -ForegroundColor DarkGray -NoNewline

    Write-VcsStatus

    Write-Host "`n`rposh" -NoNewline
    return "> "
}