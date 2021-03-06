﻿ #Remaining 277 from Disposals 301214 removal script
 $deletes = get-content c:\110215deletes.csv
 #$NotFound = @()
 $Removed = @()
 
foreach ($asset in $deletes) {
    $tempVar = Get-ADComputer $asset
    if ($tempVar -like "Get-ADComputer : Cannot find an object with an identity: 'asset' under:" ) {
      
      
      #$NotFound += "Cannot find Asset "$asset
      
      Write-Host "#########################"  
      Write-Host "Computer object NOT FOUND"
      Write-Host "#########################"  
    }
    else{
       Write-Host "#########################"  
       Write-Host "Computer object exists"
       Write-Host "#########################"
       $Removed += Get-ADComputer $asset -Properties *
       Remove-ADComputer -Identity $asset -Confirm:$false
       #Remove-ADComputer $asset -Confirm:$false
       Remove-ADObject -Identity $asset -Recursive -Confirm:$false
           
    }
}  
#$NotFound | Export-Csv c:\ADNotFound.csv
$Removed | Export-Csv c:\110215Deleteproof.csv
