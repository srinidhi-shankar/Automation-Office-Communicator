$Logfile = "C:\Users\I16881\AppData\Local\Temp\OCSlog.txt"

Function LogWrite
{
   Param ([string]$logstring)

   Add-content $Logfile -value $logstring
}

Import-module "c:\Program Files (x86)\Microsoft Office Communicator\SDK\CommunicatorAPI.DLL"
$communicator = new-object 'CommunicatorAPI.MessengerClass'
$communicator.autoSignin()
if( (Get-Date).Hour -ge 8 -and (Get-Date).Hour -lt 17 -and (Get-Date).DayOfWeek -ne'Sunday' -and (Get-Date).DayOfWeek -ne'Saturday')
{
$communicator.MyStatus =[CommunicatorAPI.MISTATUS]::MISTATUS_ONLINE
}
else
{
$communicator.MyStatus =[CommunicatorAPI.MISTATUS]::MISTATUS_AWAY
}

Trap [EXCEPTION]
{
	LogWrite (Get-Date);
    LogWrite ("Exception.Name " + $_.Exception.GetType().Name);
    LogWrite ("Message:       " + $_.Exception.Message); 
    LogWrite ("StackTrace:    " + $_.Exception.StackTrace +"`n`n");
	continue;
}
