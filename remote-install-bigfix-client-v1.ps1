#Custom PS Script to silent install BigFix client with Masthead file to specfied workstations (FQDN) based from a list named "targetpcs.txt. Works best in AD enviroment. 

$Servers = Get-content "C:\Users\bryan\Documents\Notes\Scripts\targetpcs.txt"
$Folder = "C:\BigFixClient\BigFix-BES-Client-10.0.9.21.exe" , "C:\BigFixClient\masthead.afxm"

Foreach ($Server in $Servers) {
$Test = Test-Path -path "\\$Server\c$\Temp\"

If ($Test -eq $True) {Write-Host "Path exists, hence installing software on $Server."}

Else {(Write-Host "Path doesn't exist, hence Creating folder on "Server and starting installation") , (New-Item -ItemType Directory -Name Temp -Path "\\$Server\c$")}
Write-Output "Copying Files to C:\Temp\"
Copy-Item $Folder "\\$Server\c$\Temp\"
Write-Output "Second Part - Installing Software on $Server"

Invoke-Command -ComputerName $Server -ScriptBlock {(&cmd.exe /c "c:\Temp\BigFix-BES-Client-10.0.9.21.exe /sAll /sr) , (Remote-Item -path "C:\Temp\BigFix-BES-Client-10.0.9.21.exe , "C:\Temp\masthead.afxm" -ErrorAction Ignore)

}

}
