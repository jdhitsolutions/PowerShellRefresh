Function Get-CriticalEventLogEntry {
    [CmdletBinding()]
    Param(
        [Parameter(
            Position = 0,
            Mandatory,
            HelpMessage = 'Specify a Windows event log name like System.'
        )]
        [string]$LogName,
        [Parameter(ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string]$Computername =$env:COMPUTERNAME,
        [int]$Count = 20
    )

    Begin {
        #not used
    }
    Process {
        Write-Verbose "Getting $LogName entries from $Computername"
        Get-WinEvent -FilterHashtable @{LogName = $LogName; Level = 2,3 } -MaxEvents $Count -ComputerName $Computername |
        Select-Object -property @{Name="Computername";Expression = "$_.MachineName"},
        TimeCreated,ID,ProviderName,Message,LevelDisplayName,
        @{Name="LogName";Expression={$_.ContainerLog}}
    }
    End {
        #not used
    }
} #close Get-CriticalEventLogEntry