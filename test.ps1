# Define the data as an array of custom objects
$data = @(
    [PSCustomObject]@{name="hi"; description="don't settle"; system="sight"; redundant="dumb"}
    [PSCustomObject]@{name="hello"; description="why not"; system="settle"; redundant="settle"}
    [PSCustomObject]@{name="this"; description="just fails"; system="why?"; redundant="settle"}
)

# Export the data to a CSV file in the current folder
$data | Export-Csv -Path "./data.csv" -NoTypeInformation -Encoding UTF8

Write-Host "CSV file with the table has been generated in the current folder as data.csv"