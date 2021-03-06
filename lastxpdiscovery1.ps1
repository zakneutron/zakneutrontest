 #Remaining 353 XP devices. Amend filepath once working
 $xplist = get-content c:\lastxpdevices110215.csv
 $NotFound = @()
 $Found = @()
 
foreach ($asset in $xplist) {
    $tempVar = Get-ADComputer $asset
    #Amend Error Message for missing or unreachable device
    if ($tempVar -like "Get-ADComputer : Cannot find an object with identity: 'asset' under:" ) {
        $NotFound += "Cannot find Asset " $asset
            }
        # Save this list to a snagging list
    else {
       $Found += Get-ChildItem –Force” "\\"$asset"\c$\Documents and Settings” | Select "LastFile Name
       }
    }
$NotFound | Export-Csv "c:\XPNotFound"$(get-date -f yyyyMMddhhmmss)".csv"
$Found| Export-Csv "c:\Found"$(get-date -f yyyyMMddhhmmss)".csv"