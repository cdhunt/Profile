<#
.SYNOPSIS
    An Optionality helper function.
.DESCRIPTION
    Select-ObjectMaybe (Alias: Maybe) helps you deal handle possible $null return values or mixed-type collections.
.PARAMETER InputObject
    Any pipeline Input.
.PARAMETER Type
    A given type to select. Only Input of this type will be Output.
.PARAMETER Just
    A given value to select. Only Input with this value will be Output.
.PARAMETER Of
    A collection of values to select. Any Input with a value mathing one the value of any values in this collection will be Output
.PARAMETER FilterScript
    A ScriptBlock that defines a boolean check against the Input.
.PARAMETER OtherWise
    If no Input matches the provided parameters, this value will be Output.
.EXAMPLE
    PS C:\> $null | Maybe int -OtherWise 0
    0
.EXAMPLE
    PS C:\> echo 1 2 3 | Maybe -Of @(1,2)
    1
    2
.EXAMPLE
    PS C:\> Get-Process | Maybe -FilterScript {$_.Name -eq 'PowerShell'} -OtherWise 'No instance of PowerShell is running'
    Handles  NPM(K)    PM(K)      WS(K)     CPU(s)     Id  SI ProcessName
    -------  ------    -----      -----     ------     --  -- -----------
       1411      63   274596       6092      27.91   1112   1  powershell
.EXAMPLE
    PS C:\> Get-Process | Maybe -FilterScript {$_.Name -eq 'NotARealProcess'} -OtherWise (New-Object Diagnostics.Process)
    Handles  NPM(K)    PM(K)      WS(K)     CPU(s)     Id  SI ProcessName
    -------  ------    -----      -----     ------     --  -- -----------
                  0        0          0
.NOTES
    General notes
#>
function Select-ObjectMaybe
{
    [CmdletBinding(DefaultParameterSetName='Just')]
    [Alias('Maybe')]
    Param
    (
        [Parameter(ValueFromPipeline=$true,
                   Position=4)]
        $InputObject,

        [Parameter(Position=0)]
        [Type]
        $Type,

        [Parameter(ParameterSetName='Just', Position=1)]
        [object]
        $Just,

        [Parameter(ParameterSetName='Of', Position=1)]
        [object[]]
        $Of,

        [Parameter(ParameterSetName='FilterScript', Position=2)]
        [ScriptBlock]
        $FilterScript,

        [Parameter(ParameterSetName='Just', Position=3)]
        [Parameter(ParameterSetName='Of', Position=3)]
        [Parameter(ParameterSetName='FilterScript', Position=3)]
        [object]
        $OtherWise
    )

    Begin
    {

        $yesMaybe = $false

    }
    Process
    {

        foreach ($i in $InputObject)
        {

            if ($PSBoundParameters.ContainsKey('Type') -and $PSBoundParameters.ContainsKey('Just'))
            {
                if ($i -is $Type -and $i -eq $Just) {
                    Write-Output -InputObject $i
                    $yesMaybe = $true
                }
            }
            elseif ($PSBoundParameters.ContainsKey('Just'))
            {
                if ($i -eq $Just) {
                    Write-Output -InputObject $i
                    $yesMaybe = $true
                }
            }
            elseif ($PSBoundParameters.ContainsKey('Type') -and $PSBoundParameters.ContainsKey('Of'))
            {
                if ($i -is $Type -and $Of -contains $i) {
                    Write-Output -InputObject $i
                    $yesMaybe = $true
                }
            }
            elseif ($PSBoundParameters.ContainsKey('Of'))
            {
                if ($Of -contains $i) {
                    Write-Output -InputObject $i
                    $yesMaybe = $true
                }
            }
            elseif ($PSBoundParameters.ContainsKey('Type') -and $PSBoundParameters.ContainsKey('FilterScript'))
            {
                if ($i -is $Type -and $FilterScript.InvokeWithContext($null, (New-Object PSVariable @('_', $i)), $null)) {
                    Write-Output -InputObject $i
                    $yesMaybe = $true
                }
            }
            elseif ($PSBoundParameters.ContainsKey('FilterScript'))
            {
                if ($FilterScript.InvokeWithContext($null, (New-Object PSVariable @('_', $i)), $null)) {
                    Write-Output -InputObject $i
                    $yesMaybe = $true
                }
            }
            elseif ($PSBoundParameters.ContainsKey('Type'))
            {
                if ($i -is $Type) {
                    Write-Output -InputObject $i
                    $yesMaybe = $true
                }
            }

        }

    }
    End
    {

        if ($PSBoundParameters.ContainsKey('OtherWise') -and -not $yesMaybe)
        {
            Write-Output -InputObject $OtherWise
        }

    }
}