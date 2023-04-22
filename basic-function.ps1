Function Get-CriticalEventLogEntry {
    [CmdletBinding()]
    Param(
        [Parameter(
            Position = 0,
            Mandatory,
            HelpMessage = 'Specify a Windows event log name like System.'
        )]
        [string]$LogName,
        [string]$Computername = $env:COMPUTERNAME,
        [int]$Count = 20
    )

    Get-WinEvent -FilterHashtable @{LogName = $LogName; Level = 2,3 } -MaxEvents $Count -ComputerName $Computername
} #close Get-CriticalEventLogEntry