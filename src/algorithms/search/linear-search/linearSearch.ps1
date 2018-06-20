. $PSScriptRoot\..\..\..\utils\comparator\Comparator.ps1

function linearSearch {
    param(
        $array,
        $seekElement,
        $comparatorCallback
    )

    $comparator = new-object Comparator $comparatorCallback
    $foundIndices = @()
    $upperBound = $array.Count - 1

    for ($index = 0; $index -le $upperBound; $index += 1) {
        $element = $array[$index]
        if ($comparator.equal($element, $seekElement)) {
            $foundIndices += $index
        }
    }

    # array.forEach((element, index) = > {
    #         if (comparator.equal(element, seekElement)) {
    #             foundIndices.push(index);
    #         }
    #     });

    return $foundIndices
}