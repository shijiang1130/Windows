4.0 for win7 64
https://www.microsoft.com/en-us/download/details.aspx?id=40855

```powershell

PS > Get-WmiObject win32_logicaldisk | ft DeviceID,{$_.FreeSpace/1GB},{$_.size/1GB}

DeviceID                                                       $_.FreeSpace/1GB                             $_.size/1GB
--------                                                       ----------------                             -----------
A:                                                                            0                                       0
C:                                                             11.7756996154785                        89.8994102478027
D:                                                                            0                                       0


PS > get-date

Friday, November 17, 2017 1:53:54 AM
foreach($ip in (ipconfig) -like '*IPv4*') { ($ip -split ' : ')[-1]}
