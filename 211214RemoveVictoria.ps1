 #CSV files of confirmed disposed assets from Victoria and CLifton Lists = 22/12/14
 $victoriadelete = get-content c:\221214deletevictoria.csv
 #$NotFound = @()
 $Removed = @()
 
foreach ($asset in $victoriadelete) {
    $tempVar = Get-ADComputer $asset
    if ($tempVar -like "Get-ADComputer : Cannot find an object with identity: 'asset' under:" ) {
      
      
      #$NotFound += "Cannot find Asset " $id
      
      Write-Host "#########################"  
      Write-Host "Computer object NOT FOUND"
      Write-Host "#########################"  
    }
    else{
       Write-Host "#########################"  
       Write-Host "Computer object exists"
       Write-Host "#########################"
       $Removed += Get-ADComputer $asset -Properties *
       Remove-ADComputer $asset -Confirm:$false
       #| @(Get-WmiObject -ComputerName $id -Namespace root\cimv2 -Class Win32_ComputerSystem)[0].UserName;    
    }
}  
#$NotFound | Export-Csv u:\ADNotFound.csv
$Removed | Export-Csv c:\VictoriaDeleteproof.csv