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


function Test-MemoryUSage{
[cmdletbinding()]
Param()

$os = Get-CimInstance win32_operatingsystem 
$pctFree = [math]::Round(($os.FreePhysicalMemory/$os.TotalVisibleMemorySize)*100,2)

if($pctFree -ge 45) {
$status = "OK"
}
elseif($pctFree -ge 15) {
$status = "Warning"
}
else {
$status="Critical"
}

$os | Select @{Name = "Status";Expression = {$Status}},
@{Name = "PctFree";Expression={$pctFree}},
@{Name = "FreeGB";Expression={[math]::Round($_.FreePhysicalMemory/1mb,2)}},
@{Name = "TotalGB";Expression={[int]($_.TotalVisibleMemorySize/1mb)}}
}

PS C:\Users\> Test-MemoryUSage | ft -AutoSize

Status  PctFree FreeGB TotalGB
------  ------- ------ -------
Warning   26.33   1.02       4
