function changedomainpw($domain)
{
param (    
 $oldPassword = $( Read-Host -AsSecureString "Old password"),    
 $newPassword = $( Read-Host -AsSecureString "New password")
)

$MethodDefinition = @'
[DllImport("netapi32.dll", CharSet = CharSet.Unicode)]
public static extern bool NetUserChangePassword(string domainname, string username, string oldPassword, string newPassword);
'@

$NetAPI32 = Add-Type -MemberDefinition $MethodDefinition -Name 'NetAPI32' -Namespace 'Win32' -PassThru
$oldPassword = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($oldPassword))
$newPassword = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($newPassword))
$NetAPI32::NetUserChangePassword($domain, $env:username, $oldPassword, $newPassword)
}
