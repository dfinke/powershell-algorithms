function longestCommonSubsequnce($set1, $set2) {
    # # Init LCS matrix.
    # const lcsMatrix = Array(set2.length + 1).fill(null).map(() => Array(set1.length + 1).fill(null));

    $lcsMatrix = (0..($set2.Count + 1)).ForEach{New-Object object[] ($set1.Count + 1) }

    # Fill first row with zeros.
    for ($columnIndex = 0; $columnIndex -le $set1.Count; $columnIndex += 1) {
        $lcsMatrix[0][$columnIndex] = 0
    }

    # Fill first column with zeros.
    for ($rowIndex = 0; $rowIndex -le $set2.Count; $rowIndex += 1) {
        $lcsMatrix[$rowIndex][0] = 0
    }

    # Fill rest of the column that correspond to each of two strings.
    for ($rowIndex = 1; $rowIndex -le $set2.Count; $rowIndex += 1) {
        for ($columnIndex = 1; $columnIndex -le $set1.Count; $columnIndex += 1) {
            if ($set1[$columnIndex - 1] -eq $set2[$rowIndex - 1]) {
                $lcsMatrix[$rowIndex][$columnIndex] = $lcsMatrix[$rowIndex - 1][$columnIndex - 1] + 1
            }
            else {
                $lcsMatrix[$rowIndex][$columnIndex] = [Math]::max(
                    $lcsMatrix[$rowIndex - 1][$columnIndex],
                    $lcsMatrix[$rowIndex][$columnIndex - 1]
                )
            }
        }
    }

    # Calculate LCS based on LCS matrix.
    if (!$lcsMatrix[$set2.Count][$set1.Count]) {
        # If the length of largest common string is zero then return empty string.
        return @('')
    }

    $longestSequence = @()
    $columnIndex = $set1.Count
    $rowIndex = $set2.Count

    while ($columnIndex -gt 0 -or $rowIndex -gt 0) {
        if ($set1[$columnIndex - 1] -eq $set2[$rowIndex - 1]) {
            # Move by diagonal left-top.
            # $longestSequence.unshift($set1[$columnIndex - 1])
            $longestSequence = @($set1[$columnIndex - 1]) + $longestSequence
            $columnIndex -= 1
            $rowIndex -= 1
        }
        elseif ($lcsMatrix[$rowIndex][$columnIndex] -eq $lcsMatrix[$rowIndex][$columnIndex - 1]) {
            # Move left.
            $columnIndex -= 1
        }
        else {
            # Move up.
            $rowIndex -= 1
        }
    }

    return $longestSequence
}
