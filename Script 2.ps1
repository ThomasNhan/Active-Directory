Import-Module ActiveDirectory
$csvpath= 'C:\Users\Administrator\Desktop\CSV\Script 2.csv'
$csvfile = Import-Csv -path $csvpath
ForEach ($item In $CSV){
$name = $item.name
$description = $item.description
$category = $item.category
$scope = $item.scope
$OUpath = $item.oupath
New-ADGroup -Name $name -Description $description -GroupCategory $category -GroupScope $scope -Path $OUpath
}