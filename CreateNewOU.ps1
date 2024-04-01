#Gathering Data to create the OU
$OUName = Read-Host "Enter the new OU name"
$OUCheck = [adsi]::Exists("LDAP://OU=$OUName, DC=VinoLab, DC=com")


#Validate if OU already exists. If it does it will return an error. If not it will create the new OU.
if ($OUCheck -eq $true) {
Write-Host "ERROR: This OU Already Exists!" -ForegroundColor Red
}


if ($OUCheck -eq $false) {
New-ADOrganizationalUnit -Name $OUName -ProtectedFromAccidentalDeletion $false
Write-Host "$OUName has successfully been created " -ForegroundColor Green
}

#Keep the window open
Write-Host "Exit the script"
pause
