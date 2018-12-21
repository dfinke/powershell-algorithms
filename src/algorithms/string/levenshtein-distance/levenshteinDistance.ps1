function levenshteinDistance([string]$a, [string]$b) {

    # Create empty edit distance matrix for all possible modifications of
    # substrings of a to substrings of b.
    $distanceMatrix = (0..($b.Length + 1)).ForEach( {New-Object object[] ($a.Length + 1)} )

    # Fill the first row of the matrix.
    # If this is first row then we're transforming empty string to a.
    # In this case the number of transformations equals to size of a substring.
    for ($i = 0; $i -le $a.length; $i += 1) {
        $distanceMatrix[0][$i] = $i
    }

    # Fill the first column of the matrix.
    # If this is first column then we're transforming empty string to b.
    # In this case the number of transformations equals to size of b substring.
    for ($j = 0; $j -le $b.length; $j += 1) {
        $distanceMatrix[$j][0] = $j;
    }

    for ($j = 1; $j -le $b.length; $j += 1) {
        for ($i = 1; $i -le $a.length; $i += 1) {
            $indicator = if ($a[$i - 1] -eq $b[$j - 1]) {0} else {1}

            $min = [math]::Min(($distanceMatrix[$j][$i - 1] + 1), ($distanceMatrix[$j - 1][$i] + 1))
            $distanceMatrix[$j][$i] = [math]::Min($min, ($distanceMatrix[$j - 1][$i - 1] + $indicator))
        }
    }

    $distanceMatrix[$b.length][$a.length]
}