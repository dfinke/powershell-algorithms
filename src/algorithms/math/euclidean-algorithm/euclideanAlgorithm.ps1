function euclideanAlgorithm($originalA, $originalB) {
    $a = [Math]::Abs($originalA)
    $b = [Math]::Abs($originalB)

    if ($a -eq 0 -and $b -eq 0) {
        return $null
    }

    if ($a -eq 0 -and $b -ne 0) {
        return $b
    }

    if ($a -ne 0 -and $b -eq 0) {
        return $a
    }

    # Normally we need to do subtraction ($a - $b) but to prevent
    # recursion occurs to often we may shorten subtraction to ($a % $b).
    # Since ($a % $b) normally means that we've subtracted $b from a
    # many times until the difference became less then a.

    if ($a -gt $b) {
        return euclideanAlgorithm ($a % $b) $b
    }

    return euclideanAlgorithm ($b % $a) $a
}