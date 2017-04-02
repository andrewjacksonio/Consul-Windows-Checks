$OS = Get-WmiObject -Class Win32_OperatingSystem
[double]$MemUsage="{0:N2}" -f ((($OS.TotalVisibleMemorySize - $OS.FreePhysicalMemory)*100)/ $OS.TotalVisibleMemorySize)
$MemUsageObj = New-Object PSObject -Property @{MemoryUsage=$MemUsage}

if ($MemUsageObj.MemoryUsage -gt 95) 
{
    $MemUsageObj | Write-Output
    exit 2
} 
elseif ($MemUsageObj.MemoryUsage -gt 85) 
{
    $MemUsageObj | Write-Output
    exit 1
} 
else 
{
    $MemUsageObj | Write-Output
    exit 0
}