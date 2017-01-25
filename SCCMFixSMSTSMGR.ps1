# Fix for Software center show application stuck at Installing  
# https://social.technet.microsoft.com/Forums/en-US/e382da34-079c-4619-8fdb-e5e44c436857/software-center-show-application-stuck-at-installing?forum=configmanagerapps  
# Add service dependency for SMSTSMGR against CCMEXEC  
# Author: Mike Palmer  
# Date: 3rd July 2015  
# Version: 1.01 
  
# Get Service Details  
$service = get-service smstsmgr 
  
# Check ServiceDependedOn Array  
if (($service.ServicesDependedOn).name -notcontains "ccmexec")  
{  
 write-host "Not present...Configuring Service"  
 start-process sc.exe -ArgumentList "config smstsmgr depend= winmgmt/ccmexec" -wait  
}  
else  
{  
 write-host "Present..Taking no action"  
} 