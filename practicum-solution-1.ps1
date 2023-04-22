<#

1. Write a PowerShell script to find all processes with a working set size greater or equal to 100MB
and save the process name, ID, workingset size, the number of handles, and the process owner to a
CSV file.
The output should be sorted by working set size in descending order.
#>

Param(
    [String]$Path = ".\ProcessReport.csv"
)

Get-Process -IncludeUserName | Where-Object {$_.WorkingSet -ge 100MB} |
Sort-Object -Property WorkingSet -Descending |
Select-Object Name,ID,WorkingSet,Handles,UserName |
Export-CSV -Path $Path

Get-Item -Path $Path