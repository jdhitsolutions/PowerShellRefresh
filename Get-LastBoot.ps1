Function Get-LastBoot {
    [cmdletbinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string[]]$computername = $env:computername
    )

    Begin {
        Write-Verbose "[$((Get-Date).TimeOfDay) BEGIN  ] Starting $($MyInvocation.MyCommand)"
        $paramHash = @{
            class        = "Win32_OperatingSystem"
            ComputerName = $Null
            ErrorAction  = "Stop"
            Property     = "LastBootUpTime", "CSName", "Caption"
        }
    } #begin

    Process {
        Write-Verbose "[$((Get-Date).TimeOfDay) PROCESS] Processing"

        Foreach ($computer in $Computername) {
            $paramHash.computername = $computer

            try {
                $data = Get-CimInstance @paramHash
                [PSCustomObject]@{
                    PSTypeName      = "PSLastBootInfo"
                    Computername    = $data.CSName
                    LastBoot        = $data.LastBootUpTime
                    OperatingSystem = $data.Caption
                }
            }
            catch {
                Write-Warning "There was an error: $($error[0].Exception.message)"
            }
        } #foreach computer
    } #process

    End {
        Write-Verbose "[$((Get-Date).TimeOfDay) END    ] Ending $($MyInvocation.MyCommand)"
    } #end
} #end function
