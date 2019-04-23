Import-Module ActiveDirectory
$csvpath= 'C:\Users\Administrator\Desktop\CSV\Script1.csv'
$csvfile = Import-Csv -path $csvpath
foreach ($user in $csvfile){
    $username = $user.username
    $firstname = $user.firstname
    $lastname = $user.lastname
    $description = $user.description
    $OUPATH = $user.oupath
    $Action = $user.action
    if ($Action -like "Add")
    {New-ADUser -name $username -GivenName $firstname -Surname $lastname -Description $description -Path $OUPATH}

    elseif ($Action -like "Remove")
    {Remove-ADUser -Identity $username}
    }