# Define the data as an array of custom objects
$data = @(
    [PSCustomObject]@{name="hi"; description="don't settle"; system="sight"; redundant="dumb"}
    [PSCustomObject]@{name="hello"; description="why not"; system="settle"; redundant="settle"}
    [PSCustomObject]@{name="this"; description="just fails"; system="why?"; redundant="settle"}
)

# Export the data to a CSV file in the current folder
$data | Export-Csv -Path "./data.csv" -NoTypeInformation -Encoding UTF8

Write-Host "CSV file with the table has been generated in the current folder as data.csv"


Start-Sleep -Seconds 1.5

# Define the CSV file path
$csvFilePath = "./data.csv"

# Check if the CSV file exists
if (!(Test-Path -Path $csvFilePath)) {
    Write-Host "CSV file not found at $csvFilePath. Please ensure it exists."
    exit
}

# Import data from the CSV file
$data = Import-Csv -Path $csvFilePath

# Filter data by name (e.g., "hello")
$nameToFilter = "hello"
$filteredData = $data | Where-Object { $_.name -eq $nameToFilter }

if ($filteredData.Count -eq 0) {
    Write-Host "No data found with name '$nameToFilter'."
    exit
}

# Generate a folder name based on the current date and time
$timestamp = Get-Date -Format "yyyyMMddhHmmss"
$folderName = "./$timestamp"

# Create the folder
New-Item -ItemType Directory -Path $folderName | Out-Null

# Define the output CSV file path
$outputFilePath = "$folderName/data.csv"

# Export the filtered data to the new CSV file
$filteredData | Export-Csv -Path $outputFilePath -NoTypeInformation -Encoding UTF8

Write-Host "Filtered data has been saved to $outputFilePath"