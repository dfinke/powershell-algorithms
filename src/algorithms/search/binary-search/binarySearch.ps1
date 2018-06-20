. $PSScriptRoot\..\..\..\utils\comparator\Comparator.ps1

function binarySearch {
    param($sortedArray, $seekElement, $comparatorCallback)

    $comparator = New-Object Comparator $comparatorCallback

    $startIndex = 0
    $endIndex = $sortedArray.length - 1

    while ($startIndex -le $endIndex) {
        $middleIndex = $startIndex + [Math]::floor(($endIndex - $startIndex) / 2)

        # If we've found the element just return its position.
        if ($comparator.equal($sortedArray[$middleIndex], $seekElement)) {
            return $middleIndex
        }

        # Decide which half to choose for seeking next: left or right one.
        if ($comparator.lessThan($sortedArray[$middleIndex], $seekElement)) {
            # Go to the right half of the array.
            $startIndex = $middleIndex + 1
        }
        else {
            # Go to the left half of the array.
            $endIndex = $middleIndex - 1
        }
    }

    return -1
}
