function hammingDistance($a, $b) {
    if ($a.length -ne $b.length) {
        throw 'Strings must be of the same length'
    }

    $distance = 0

    for ($i = 0; $i -lt $a.length; $i += 1) {
        if ($a[$i] -ne $b[$i]) {
            $distance += 1
        }
    }

    $distance
}