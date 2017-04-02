$disk = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'"
[int]$freePercent="{0:N2}" -f ($disk.FreeSpace/$disk.Size*100)
$freePercentObj = New-Object PSObject -Property @{C_PercentageFree=$freePercent}

if ($freePercentObj.C_PercentageFree -lt 5) 
{
    $freePercentObj | Write-Output
    exit 2
} 
elseif ($freePercentObj.C_PercentageFree -lt 15) 
{
    $freePercentObj | Write-Output
    exit 1
} 
else 
{
    $freePercentObj | Write-Output
    exit 0
}