# not sure about this one yet, untested
# source file is a list of pc names from workstaion-pcs.txt

$names = Get-content workstation-pcs.txt
test-Connection $names -asjob -count 1 | receive-job -wait -auto