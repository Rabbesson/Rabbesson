YES WEE CAN
Import-Module ActiveDirectory

function AddAdgroup {
    
#Database Instant File Initialization
#-----------------------------------------------------------------------------------------------------------
Write-Host -ForegroundColor Yellow "Database Instant File Initialization started"
$AddADGroup1 = Add-ADGroupMember -Identity $Adgroup -Member $SetSvcAccount


#$CheckAdGroupMember = Get-ADPrincipalGroupMembership -Identity $SetSvcAccount | where {$_.name -ccontains "gg-ou-common-sqlservice-maintenance"} | select name
$CheckAdGroupMember1 = Get-ADGroupMember -Identity $Adgroup | where {$_.name -eq $SetSvcAccount} | select name

    if ($CheckAdGroupMember1.name -eq $SetSvcAccount) {
        Write-Host -ForegroundColor green "Database Instant File Initialization Completed, User '$SetSvcAccount'added to AD-group '$Adgroup'"
        }
        else {  Write-Host -ForegroundColor red "Database Instant File Initialization failed, user'$SetSvcAccount' not added to AD-group'$Adgroup' "
        }

#Lock Pages in Memory process
#-----------------------------------------------------------------------------------------------------------

Write-Host -ForegroundColor Yellow "Lock Pages in Memory process started"
$AddAdGroup2 = Add-ADGroupMember -Identity $Adgroup2 -Member $SetSvcAccount
#invoke-expression -Command $AddAdGroup2 -ErrorAction Stop
$CheckAdGroupMember2 = Get-ADGroupMember -Identity $Adgroup2 | where {$_.name -eq $SetSvcAccount} | select name
    
    if ($CheckAdGroupMember2 -match $SetSvcAccount) {
        Write-Host -ForegroundColor green "Lock Pages in Memory process 50% completed, User '$SetSvcAccount'added to AD-group '$Adgroup2'"
        }
        else {  Write-Host -ForegroundColor red "Lock Pages in Memory process failed, User '$SetSvcAccount'not added to AD-group '$Adgroup2'"
        }



$AddAdGroup3 = Add-ADGroupMember -Identity $Adgroup3 -Member ($HostName + "$") -PassThru
$CheckAdGroupMember3 = Get-ADGroupMember -Identity $Adgroup3 | where {$_.name -eq $HostName} | select name

    if ($CheckAdGroupMember2 -match $SetSvcAccount) {
        Write-Host -ForegroundColor green "Lock Pages in Memory process 100% completed, User '$HostName'added to AD-group '$Adgroup3'"
        }
        else {  Write-Host -ForegroundColor red "Lock Pages in Memory process failed, server '$HostName'not added to AD-group '$Adgroup3'"
        }


}

da
  
