. $PSScriptRoot\..\binarySearch.ps1

describe 'binarySearch' {
    it 'should search number in sorted array' {
        binarySearch @() 1 | Should Be -1
        binarySearch @(1) 1 | Should Be 0
        binarySearch @(1, 2) 1 | Should Be 0
        binarySearch @(1, 2) 2 | Should Be 1
        binarySearch @(1, 5, 10, 12) 1 | Should Be 0
        binarySearch @(1, 5, 10, 12, 14, 17, 22, 100) 17 | Should Be 5
        binarySearch @(1, 5, 10, 12, 14, 17, 22, 100) 1 | Should Be 0
        binarySearch @(1, 5, 10, 12, 14, 17, 22, 100) 100 | Should Be 7
        binarySearch @(1, 5, 10, 12, 14, 17, 22, 100) 0 | Should Be -1
    }

    it 'should search object in sorted array' {
        $sortedArrayOfObjects = @(
            @{ key = 1; value = 'value1' }
            @{ key = 2; value = 'value2' }
            @{ key = 3; value = 'value3' }
        )

        $comparator = {
            param($a, $b)

            if ($a.key -eq $b.key) {return 0}
            if ($a.key -lt $b.key) {
                return -1
            }
            return 1
        }

        binarySearch @() @{ key = 1 } $comparator | Should Be -1
        binarySearch $sortedArrayOfObjects @{ key = 4 } $comparator | Should Be -1
        binarySearch $sortedArrayOfObjects @{ key = 1 } $comparator | Should Be 0
        binarySearch $sortedArrayOfObjects @{ key = 2 } $comparator | Should Be 1
        binarySearch $sortedArrayOfObjects @{ key = 3 } $comparator | Should Be 2
    }
}
