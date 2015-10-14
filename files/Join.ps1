Param(
[string]$dnsIP
)


$dns = $dnsIP -replace "X","."
$wmi = Get-WmiObject win32_networkadapterconfiguration -filter "ipenabled = 'true'"
$wmi.SetDNSServerSearchOrder($dns)


$domain = "ecrm.local"
$password = "R3cruit3r" | ConvertTo-SecureString -asPlainText -Force
$username = "ecrm\crmadmin" 
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
Add-Computer -DomainName $domain -Credential $credential
