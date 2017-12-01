$Import =Import-CSV "import.csv"
$OU = "OU=Testuser,DC=Company,DC=Com"
 
Foreach ($user in $Import)
 {
    $password = $user.Password | ConvertTo-SecureString -AsPlainText -Force
    New-ADUser -Name $user.Name -GivenName $user.FirstName -Surname $user.LastName -Path $OU -AccountPassword $Password -ChangePasswordAtLogon $True -Enabled $True
 }
