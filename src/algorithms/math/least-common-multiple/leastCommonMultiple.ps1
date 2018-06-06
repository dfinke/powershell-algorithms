. $PSScriptRoot\..\euclidean-algorithm\euclideanAlgorithm.ps1

function leastCommonMultiple([double]$a, [double]$b) {
    if ($a -eq 0 -and $b -eq 0) {
        return 0
    }

    [Math]::Abs($a * $b) / (euclideanAlgorithm $a $b)
}