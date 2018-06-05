function fibonacciNth($n) {
    $currentValue = 1
    $previousValue = 0

    if ($n -eq 1) {
        return 1
    }

    $iterationsCounter = $n - 1

    while ($iterationsCounter) {
        $currentValue += $previousValue
        $previousValue = $currentValue - $previousValue

        $iterationsCounter -= 1
    }

    $currentValue
}
