function permutateWithoutRepetitions($permutationOptions) {
    if ($permutationOptions.Count -eq 0) {
        return @()
    }

    if ($permutationOptions.Count -eq 1) {
        return @($permutationOptions)
    }

    $permutations = @()

    # Get all permutations of length (n - 1).
    # $previousOptions = $permutationOptions.slice(0, permutationOptions.length - 1);
    $previousOptions = $permutationOptions[0..($permutationOptions.Count - 1)]
    $previousPermutations = permutateWithoutRepetitions $previousOptions

    # Insert last option into every possible position of every previous permutation.
    #$lastOption = $permutationOptions.slice(permutationOptions.length - 1);
    $lastOption = $permutationOptions.slice[-1]

    for (
        $permutationIndex = 0;
        $permutationIndex -lt $previousPermutations.Count
        $permutationIndex += 1
    ) {
        $currentPermutation = $previousPermutations[$permutationIndex]

        # Insert last option into every possible position of currentPermutation.
        for ($positionIndex = 0; $positionIndex -le $currentPermutation.Count; $positionIndex += 1) {
            $permutationPrefix = $currentPermutation[0..$positionIndex]
            $permutationSuffix = $currentPermutation[$positionIndex]
            # permutations.push(permutationPrefix.concat(lastOption, permutationSuffix));
            # $permutations+=$permutationPrefix.concat($lastOption, $permutationSuffix))
            $permutations += $permutationPrefix + $lastOption + $permutationSuffix
        }
    }

    $permutations
}