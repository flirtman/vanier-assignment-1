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

