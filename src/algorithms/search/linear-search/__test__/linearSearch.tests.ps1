. $PSScriptRoot\..\linearSearch.ps1

describe 'linearSearch' {
    it 'should search all numbers in array' {
        $array = 1, 2, 4, 6, 2

        linearSearch $array 10 | Should Be @()
        linearSearch $array 1 | Should Be 0
        linearSearch $array 2 | Should Be 1, 4
    }

    it 'should search all strings in array' {
        $array = 'a', 'b', 'a'

        linearSearch $array 'c' | Should Be @()
        linearSearch $array 'b' | Should Be 1
        linearSearch $array 'a' | Should Be 0, 2
    }

    it 'should search through objects as well' {
        $comparatorCallback = {
            param($a, $b)
            if ($a.key -eq $b.key) {
                return 0
            }

            if ($a.key -le $b.key) {
                return  -1
            }
            return 1
        };

        $array = @(
            @{ key = 5 }
            @{ key = 6 }
            @{ key = 7 }
            @{ key = 6 }
        )

        linearSearch $array @{ key = 10 } $comparatorCallback | Should Be @()
        linearSearch $array @{ key = 5 } $comparatorCallback | Should Be 0
        linearSearch $array @{ key = 6 } $comparatorCallback | Should Be 1, 3
    }
}