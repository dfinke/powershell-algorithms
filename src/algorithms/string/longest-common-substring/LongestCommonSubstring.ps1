function longestCommonSubstring([string]$s1, [string]$s2) {
    # Init the matrix of all substring lengths to use Dynamic Programming approach.

    $substringMatrix = (0..($s2.Length + 1)).ForEach( {New-Object object[] ($s1.Length + 1)} )


    # Fill the first row and first column with zeros to provide initial values.
    for ($columnIndex = 0; $columnIndex -le $s1.length; $columnIndex += 1) {
        $substringMatrix[0][$columnIndex] = 0
    }

    for ($rowIndex = 0; $rowIndex -le $s2.length; $rowIndex += 1) {
        $substringMatrix[$rowIndex][0] = 0
    }

    $longestSubstringLength = 0
    $longestSubstringColumn = 0
    $longestSubstringRow = 0

    for ($rowIndex = 1; $rowIndex -le $s2.length; $rowIndex += 1) {
        for ($columnIndex = 1; $columnIndex -le $s1.length; $columnIndex += 1) {
            if ($s1[$columnIndex - 1] -eq $s2[$rowIndex - 1]) {
                $substringMatrix[$rowIndex][$columnIndex] = $substringMatrix[$rowIndex - 1][$columnIndex - 1] + 1
            }
            else {
                $substringMatrix[$rowIndex][$columnIndex] = 0
            }

            # Try to find the biggest length of all common substring lengths
            # and to memorize its last character position (indices)
            if ($substringMatrix[$rowIndex][$columnIndex] -gt $longestSubstringLength) {
                $longestSubstringLength = $substringMatrix[$rowIndex][$columnIndex]
                $longestSubstringColumn = $columnIndex
                $longestSubstringRow = $rowIndex
            }
        }
    }

    if ($longestSubstringLength -eq 0) {
        # Longest common substring has not been found.
        return ''
    }

    # Detect the longest substring from the matrix.
    $longestSubstring = ''

    while ($substringMatrix[$longestSubstringRow][$longestSubstringColumn] -gt 0) {
        $longestSubstring = $s1[$longestSubstringColumn - 1] + $longestSubstring
        $longestSubstringRow -= 1
        $longestSubstringColumn -= 1
    }

    $longestSubstring
}
