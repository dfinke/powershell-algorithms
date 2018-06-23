function permutateWithRepetitions($permutationOptions) {
    # There is no permutations for empty array.
    if (!$permutationOptions -or $permutationOptions.Count -eq 0) {
        return @()
    }

    # There is only one permutation for the 1-element array.
    if ($permutationOptions.Count -eq 1) {
        return @($permutationOptions)
    }

    # Let's create initial set of permutations.
    $previousPermutations = $permutationOptions.ForEach{@($_)}
    $currentPermutations = @()
    $permutationSize = 1

    # While the size of each permutation is less then or equal to options length...
    while ($permutationSize -lt $permutationOptions.Count) {
        # Reset all current permutations.
        $currentPermutations = @()

        for ($permIndex = 0; $permIndex -lt $previousPermutations.Count; $permIndex += 1) {
            for ($optionIndex = 0; $optionIndex -lt $permutationOptions.Count; $optionIndex += 1) {
                $currentPermutation = $previousPermutations[$permIndex]
                $currentPermutation += @($permutationOptions[$optionIndex])
                $currentPermutations += $currentPermutation
            }
        }

        # Make current permutations to be the previous ones.
        # $previousPermutations = $currentPermutations.slice(0);
        $previousPermutations = $currentPermutations.clone()

        # Increase permutation size counter.
        $permutationSize += 1
    }

    return $currentPermutations
}
