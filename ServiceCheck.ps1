$Service = Get-Service w32Time
if ($Service.Status -ne 'Running') 
    {
        $Service | Write-Output
        exit 2
    } 
else 
    {
        $Service | Write-Output
        exit 0
    }