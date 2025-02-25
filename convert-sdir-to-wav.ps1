# Get all .SDIR files recursively and process them
Get-ChildItem -Filter "*.SDIR" -Recurse | ForEach-Object {
    $inputFile = $_.FullName
    $outputFile = "$($_.DirectoryName)\$($_.BaseName).wav"

    # Run ffmpeg command
    ffmpeg -i "$inputFile" -acodec pcm_s24le "$outputFile"

    # Check if conversion was successful before deleting the original file
    if (Test-Path $outputFile) {
        Remove-Item $inputFile -Force
    }
}