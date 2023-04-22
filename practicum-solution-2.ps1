<#
2. Find a command that will show you information about your network adapters.
Write a script that get all connected network adapters and show the adapter name,
MAC address, the connection speed, the interface index, the description, and the
computer name. Show the computer name with a property called ComputerName.

For extra credit, have your script take a computer name as a parameter.
#>

Param(
    [String]$ComputerName = $env:COMPUTERNAME
)

Get-NetAdapter -CimSession $Computername |
Where-Object {$_.status -eq 'up'} |
Select-Object -property Name,InterfaceDescription,
ifIndex,MacAddress,Linkspeed,
@{Name="Computername";Expression = {$_.SystemName}}