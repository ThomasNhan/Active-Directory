Import-Module ActiveDirectory
$csvpath= 'C:\Users\Administrator\Desktop\CSV\Script 3.csv'
$csvfile = Import-Csv -path $csvpath
foreach ($user in $csvfile){
    $name = $user.groupname
    $OUPATH = $user.oupath
    $Action = $user.action
    if ($Action -like "Add")
    {New-ADGroup -Name $name -Path $OUpath}

    elseif ($Action -like "Remove")
    {Remove-ADGroup -Identity $name}
    }