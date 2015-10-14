Param(
[string]$runAsUser,
[string]$runAsPassword,
[string]$sysFQDN,
[string]$roles, 
[string]$sqlServerName, 
[string]$reportingURL, 
[string]$orgName, 
[string]$defaultWeb, 
[string]$defaultPort, 
[string]$defaultOU, 
[string]$preferredDC, 
[string]$adminUser, 
[string]$adminPassword
)

#Copy-S3Object -BucketName ellucian-ecrm -Key iso/en_microsoft_dynamics_crm_server_2015_x86_x64_dvd_5853339.iso -LocalFile c:\installers\en_microsoft_dynamics_crm_server_2015_x86_x64_dvd_5853339.iso

$scriptargs = @("C:\Installers\en_microsoft_dynamics_crm_server_2015_x86_x64_dvd_5853339.iso")
$isoDrive = C:\Installers\RunScriptAsUser.ps1 $runAsUser $runAsPassword C:\Installers\MountImage.ps1 $scriptargs

$scriptargs = @($isoDrive)
C:\Installers\RunScriptAsUser.ps1 $runAsUser $runAsPassword c:\Installers\CRMPreReqInstall.ps1 $scriptargs

$scriptargs = @($roles, $sqlServerName, $reportingURL, $orgName, $defaultWeb, $defaultPort, $defaultOU, $preferredDC, $adminUser, $adminPassword, $isoDrive)
C:\Installers\RunScriptAsUser.ps1 $runAsUser $runAsPassword c:\Installers\CRMinstall_dynamic_config.ps1 $scriptargs
