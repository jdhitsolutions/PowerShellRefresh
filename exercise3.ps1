#region 1. Get the top 10 processes by workingset size

    #region answers
    Get-Process | Sort-Object -Property WorkingSet -Descending | Select-Object -first 10
    #endregion

#endregion

#region 2.

<#
Get a sorted list of the System event log sources (ProviderName) based
on the last 1000 entries. Bonus points if you only show the count and name.
#>

    #region answers
    Get-WinEvent -logname System -MaxEvents 1000 |
    Group-Object -Property ProviderName |
    Sort-Object -Property Count -Descending

    #bonus
    Get-WinEvent -logname System -MaxEvents 1000 |
    Group-Object -Property ProviderName -NoElement |
    Sort-Object -Property Count -Descending
    #endregion

#endregion

#region 3.

<#
    How many files are in your TEMP directory?
    What is the total and average size?
#>

    #region answers
    dir $env:temp -Recurse | Measure-Object -Property length -sum -average

    #better
    Get-ChildItem $env:temp -Recurse |
    Measure-Object -Property length -sum -average |
    Select-Object -Property @{Name="Path";Expression = {$env:temp}},
    Count,Average,Sum
    #endregion

#endregion

#region 4.

<#
    Get all running services that have a display name that starts with Micro,
    and show the service name, display name and its start type.
#>

    #region answers
    Get-Service -display micro* | Where status -eq 'Running' |
    Select-Object Name,Displayname,StartType

    Get-Service -display micro* | Where {$_.status -eq 'Running'} |
    Select-Object Name,Displayname,StartType
    #endregion

#endregion

#region 5 Get the numbers 1 through 10 and display the cube of each number

    #region answers
    1..10 | foreach-object { $_*$_*$_}
    #endregion

#endregion

#region 6 What is the sum from the output of the previous answer?

    #region answers
    $m = 1..10 | foreach-object { $_*$_*$_} | Measure-Object -sum
    $m.sum
    #endregion

#endregion