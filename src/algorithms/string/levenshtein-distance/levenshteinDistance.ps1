function levenshteinDistance([string]$a, [string]$b) {

    $distanceMatrix = (0..($b.Length + 1)).ForEach( {New-Object object[] ($a.Length + 1)} )

    for ($i = 0; $i -le $a.length; $i += 1) {
        $distanceMatrix[0][$i] = $i
    }

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