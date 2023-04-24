#requires -version 5.1

<#
This is a basic PowerShell function. If you use it to
query a remote computer, you must be running with credentials
that have admin rights on the remote computer and the remote
computer needs PowerShell remoting enabled.
#>
Function Get-LastBoot {
    [cmdletbinding()]
    Param(
        [string]$Computername = $env:computername
    )

    Get-CimInstance -ClassName 'Win32_OperatingSystem' -ComputerName $Computername |
    Select-Object -Property PSComputername, LastBootUpTime,
    @{Name = 'OperatingSystem'; Expression = { $_.Caption } }

} #end function