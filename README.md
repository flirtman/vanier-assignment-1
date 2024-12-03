# Description

## index.ps1
- creates data.ps1 file with example data
- waits for 1.5 min and executing script2.ps1

## script2.ps1
- reads data from data.ps1 file 
- selecting row by name of "hello"
- creating folder with current timestamp
- saving selected data to newly created folder in a file named data.csv
- waits for 1.5 min and executing script3.ps1

## script3.ps1
- checks if archive folder exist and if not creates one
- takes all folders and relocating them in to archive folder 
- waits for 1.5 min and executing script4.ps1

## script4.ps1
- does the same thing as script2.ps1 except last step