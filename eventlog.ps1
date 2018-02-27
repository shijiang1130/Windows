Get-WinEvent -Logname Security -FilterXPath "*[System[EventID=4740 and TimeCreated[timediff(@SystemTi
me) <= 3600000]]]" | Select-Object TimeCreated,@{Name='User Name';Expression={$_.Properties[0].Value}},@{Name='Source Ho
st';Expression={$_.Properties[1].Value}}
