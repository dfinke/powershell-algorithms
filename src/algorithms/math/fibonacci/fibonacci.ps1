function fibonacci ($n) {

    $targetOutput = @()
    $currentValue = 1
    $targetOutput += $currentValue
    $previousValue = 0

    if ($n -eq 1) {
        return 1
    }

    $iterationsCounter = $n - 1

    while ($iterationsCounter) {
        $currentValue += $previousValue
        $targetOutput += $currentValue
        $previousValue = $currentValue - $previousValue

        $iterationsCounter -= 1
    }

    $targetOutput
}