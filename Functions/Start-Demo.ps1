
function Start-Demo {

    $moduleLocation = Split-Path (Get-Module -ListAvailable Profile)[0].Path

    $script = Get-ChildItem "$moduleLocation\lib\Start-Demo*.ps1" | Sort -Descending | Select -ExpandProperty FullName

    & $script $args

}



