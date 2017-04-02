$AvgCpu = Get-WmiObject -Class win32_processor | Measure-Object -property LoadPercentage -Average
if ($AvgCpu.Average -gt 90) 
{
    $AvgCpu | Write-Output
    exit 2
} 
elseif ($AvgCpu.Average -gt 80) 
{
    $AvgCpu | Write-Output
    exit 1
} 
else 
{
    $AvgCpu | Write-Output
    exit 0
}