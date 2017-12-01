$users = Get-Content "Users.txt" 
foreach ($u in $users) {
         if (Get-ADUser -Filter {sAMAccountName -eq $u} -Properties emailaddress){
             $e = get-aduser -Filter {sAMAccountName -eq $u} -Properties emailaddress,lastlogonDATE,displayname | select emailaddress,LASTLOGONDATE,displayname
             Write-Host "$u !!!" $E.LASTLOGONDATE $e.emailaddress $e.displayname
             }
             else {
             Write-host "$u ..."
         }
}


 #   Get-ADUser -Filter * -Properties givenName,sn,surname,displayname,samAccountName   | % {
 #   if ( $users -contains ($_.samAccountName) ) {
  #      $_.Name + " !!!" + $_.samAccountName 
  #  } 
  #  else {
  #      #$_.Name + " does not exist in AD."
  #      $_  + " ... "
  #  }
  #  }

