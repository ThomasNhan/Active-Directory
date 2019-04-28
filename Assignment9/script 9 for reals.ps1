$path = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
#found via http://woshub.com/how-to-access-and-manage-windows-registry-with-powershell/

#test to see if there is LM file
if ((Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment') -match 'LM_LICENSE_FILE') {
    #test to see if contains the variable matching 
    if ((Get-ItemPropertyValue -Path $path -Name 'LM_LICENSE_FILE') -match '27000@test.university.com'){
    Write-Host 'you good'}
    
    #if not set variable to be so
    else {Set -ItemProperty -Path $path -name 'LM_LICENSE_FILE' -Value '27000@test.university.com'}
    }
#if no LM make it
else { New-ItemProperty -Path $path -Name 'LM_LICENSE_FILE'
    Set-ItemProperty -Path $path -Name 'LM_LICENSE_FILE' -Value '27000@test.university.com'}
