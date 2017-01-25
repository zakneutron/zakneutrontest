#Remaining 353 XP devices. Amend filepath once working
$xplist = get-content c:\testlastxpdevices110215.csv
 $NotFound = @()
 $Found = @()
 
Foreach ($xplist in Get-Content "c:\testlastxpdevices110215.csv") {
$Path = "\\$xplist\c$\Users\"
If ($Path -like "Get-Childitem : Cannot find path '\\$xplist\c$\Users\' because it does not exist.") {
      
	  Write-Host "#########################"  
      Write-Host "Computer object NOT FOUND"
      Write-Host "#########################"
	  
	  }
else {$Path = "\\$xplist\c$\Users\"
	Get-Childitem $Path | Foreach-Object{
                Get-Childitem $Path | Select LastWriteTime,Name 
				}
			}
		}
$Found | Export-Csv c:\found.csv