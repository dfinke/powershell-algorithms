function factorial($number) {
    $result = 1

    for ($i = 2; $i -le $number; $i += 1) {
        $result *= $i
    }

    $result
}
