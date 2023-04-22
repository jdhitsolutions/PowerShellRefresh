
$json = 'NetAdapterInfo.json'
. .\practicum-solution-2.ps1 | ConvertTo-JSON | Out-File -FilePath $json-Encoding UTF8
Get-Item -Path $json