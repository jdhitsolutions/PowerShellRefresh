Function Get-LastBoot {
    [cmdletbinding()]
    Param(
        [string]$Computername = $env:computername
    )

    Get-CimInstance -ClassName 'Win32_OperatingSystem' -ComputerName $Computername |
    Select-Object -Property PSComputername, LastBootUpTime,
    @{Name = 'OperatingSystem'; Expression = { $_.Caption } }

} #end function