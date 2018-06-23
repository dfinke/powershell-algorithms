function powerSet($originalSet) {
    $subSets = @()

    # We will have 2^n possible combinations (where n is a length of original set).
    # It is because for every element of original set we will decide whether to include
    # it or not (2 options for each set element).

    #$numberOfCombinations = [Math]::Pow(2, $originalSet.Count)
    $numberOfCombinations = 1 -shl $originalSet.Count

    # Each number in binary representation in a range from 0 to 2^n does exactly what we need:
    # it shoes by its bits (0 or 1) whether to include related element from the set or not.
    # For example, for the set {1, 2, 3} the binary number of 010 would mean that we need to
    # include only "2" to the current set.
    for ($combinationIndex = 0; $combinationIndex -lt $numberOfCombinations; $combinationIndex += 1) {
        $subSet = @()

        for ($setElementIndex = 0; $setElementIndex -lt $originalSet.Count; $setElementIndex += 1) {
            if ( ($combinationIndex -band (1 -shl $setElementIndex)) -gt 0) {
                $subSet += $originalSet[$setElementIndex]
            }
        }

        # Add current subset to the list of all subsets.
        $subSets += ,$subSet
    }

    return $subSets
}