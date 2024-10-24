# Ping Computer names instead of their IPS.
# Uses Test-Connect Cmdlet
# Source file = TargetPCs - workstation names.

$computers = Get-Content ".\TargetPCs.txt"
    foreach ($computers in $computers) {
        $pingComputer = Test-Connection $computer -Count 1 Quiet
        if ($pingComputer) {
            Write-Host "$computer is up"            
        } else {
            Write-Host "computer is down"
        }

    }
