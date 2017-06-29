[cmdletbinding()]

param (
 [Parameter(ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
 [string[]]$ComputerName = $env:computername,

 [Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()]
 [string]$Key

)

$service = get-wmiObject -query "select * from SoftwareLicensingService" -computername $ComputerName

$service.InstallProductKey($key)

$service.RefreshLicenseStatus()