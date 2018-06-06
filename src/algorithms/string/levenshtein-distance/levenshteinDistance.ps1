function levenshteinDistance([string]$a, [string]$b) {

    $distanceMatrix = (0..($a.Length)), (0..($b.Length))

    for ($i = 0; $i -le $a.Length; $i += 1 ) {
        $distanceMatrix[0][$i] = $i
    }

    for ($j = 0; $j -le $b.Length; $j += 1 ) {
        $distanceMatrix[$j][0] = $j
    }

    for ($j = 1; $j -le $b.length; $j += 1) {
        for ($i = 1; $i -le $a.length; $i += 1) {
            $indicator = if ($a[$i - 1] -eq $b[$j - 1]) {0} else {1}

            $min = [math]::Min(($distanceMatrix[$j][$i - 1] + 1), ($distanceMatrix[$j - 1][$i] + 1))
            $distanceMatrix[$j][$i] = [math]::Min($min, ($distanceMatrix[$j - 1][$i - 1] + $indicator))

            #       distanceMatrix[j][i] = Math.min(
            #         distanceMatrix[j][i - 1] + 1, // deletion
            #         distanceMatrix[j - 1][i] + 1, // insertion
            #         distanceMatrix[j - 1][i - 1] + indicator, // substitution
            #       );
        }
    }

    $distanceMatrix[$b.length][$a.length]
    #return 0

    #   // Create empty edit distance matrix for all possible modifications of
    #   // substrings of a to substrings of b.
    # distanceMatrix = Array(b.length + 1).fill(null).map(() => Array(a.length + 1).fill(null));

    # $distanceMatrix = New-Object 'object[,]' ($b.Length+1), ($a.Length+1)

    #   // Fill the first row of the matrix.
    #   // If this is first row then we're transforming empty string to a.
    #   // In this case the number of transformations equals to size of a substring.
    #   for (let i = 0; i <= a.length; i += 1) {
    #     distanceMatrix[0][i] = i;
    #   }
    #for ($i = 0; $i -le $a.Length; $i += 1 ) {
    #    $distanceMatrix[0][$i] = $i
    #}
    #   // Fill the first column of the matrix.
    #   // If this is first column then we're transforming empty string to b.
    #   // In this case the number of transformations equals to size of b substring.
    #   for (let j = 0; j <= b.length; j += 1) {
    #     distanceMatrix[j][0] = j;
    #   }

    #   for (let j = 1; j <= b.length; j += 1) {
    #     for (let i = 1; i <= a.length; i += 1) {
    #       const indicator = a[i - 1] === b[j - 1] ? 0 : 1;
    #       distanceMatrix[j][i] = Math.min(
    #         distanceMatrix[j][i - 1] + 1, // deletion
    #         distanceMatrix[j - 1][i] + 1, // insertion
    #         distanceMatrix[j - 1][i - 1] + indicator, // substitution
    #       );
    #     }
    #   }

    #   return distanceMatrix[b.length][a.length];
}