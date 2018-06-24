param($numberOfRuns = 5, $totalLookups = 500)

. .\binary-search\binarySearch.ps1


$Version = "{0}.{1}" -f $PSVersionTable.PSVersion.Major, $PSVersionTable.PSVersion.Minor
$Edition = "{0} {1}" -f $PSVersionTable.PSEdition, $PSVersionTable.PSVersion.PreReleaseLabel

$sortedArray = 1..10000
$lookup = 1..$totalLookups| ForEach-Object { Get-Random -Minimum 1 -Maximum 12500 }

foreach ($run in (1..$numberOfRuns)) {
    $Totalmilliseconds = Measure-Command {
        foreach ($seekElement in $lookup) {
            binarySearch -sortedArray $sortedArray -seekElement $seekElement
        }
    } | ForEach-Object totalmilliseconds

    [PSCustomObject][Ordered]@{
        Version           = $Version
        Edition           = $Edition
        ArrayCount        = $sortedArray.count
        TotalLookups      = $totalLookups
        Run               = $run
        TotalMilliseconds = $Totalmilliseconds.ToString("##.##0")
    }
}