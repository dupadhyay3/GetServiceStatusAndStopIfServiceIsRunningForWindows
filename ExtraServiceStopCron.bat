############################################################################# 
#       Author: Deepak D Upadhyay     
#       Date: 17/01/2021
#       Description: Stop Services Which You Wants to Stop
#       Github: https://github.com/dupadhyay3
#############################################################################

############################ Define Variable For Services ############## 

$ServicesList = Get-Content ".\Services.txt" 

################################## Stop Services If Services Status Is Running #################################################

Function StopServiceIfServiceStatusIsRunning ($serviceslist)
{
    foreach ($service in $serviceslist)
    {
        $serviceStatus = get-service -Name $service
        if ($serviceStatus.status -eq "Running") {
            NET STOP $serviceStatus.name
        }
    }
}

############################################Call Function#############################################
StopServiceIfServiceStatusIsRunning $ServicesList
