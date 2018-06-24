function dpLongestIncreasingSubsequence($sequence) {
    # Create array with longest increasing substrings length and
    # fill it with 1-s that would mean that each element of the sequence
    # is itself a minimum increasing subsequence.
    #  lengthsArray = Array(sequence.length).fill(1);
    $lengthsArray = (0..($sequence.Count)).ForEach{1}

    $previousElementIndex = 0
    $currentElementIndex = 1

    while ($currentElementIndex -lt $sequence.Count) {
        if ($sequence[$previousElementIndex] -lt $sequence[$currentElementIndex]) {
            # If current element is bigger then the previous one then
            # current element is a part of increasing subsequence which
            # length is by one bigger then the length of increasing subsequence
            # for previous element.
            $newLength = $lengthsArray[$previousElementIndex] + 1
            if ($newLength -gt $lengthsArray[$currentElementIndex]) {
                # Increase only if previous element would give us bigger subsequence length
                # then we already have for current element.
                $lengthsArray[$currentElementIndex] = $newLength
            }
        }

        # Move previous element index right.
        $previousElementIndex += 1;

        # If previous element index equals to current element index then
        # shift current element right and reset previous element index to zero.
        if ($previousElementIndex -eq $currentElementIndex) {
            $currentElementIndex += 1;
            $previousElementIndex = 0;
        }
    }

    # Find the biggest element in lengthsArray.
    # This number is the biggest length of increasing subsequence.
    $longestIncreasingLength = 0

    for ($i = 0; $i -lt $lengthsArray.Count; $i += 1) {
        if ($lengthsArray[$i] -gt $longestIncreasingLength) {
            $longestIncreasingLength = $lengthsArray[$i]
        }
    }

    return $longestIncreasingLength
}
