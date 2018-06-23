. $PSScriptRoot\..\powerSet.ps1

describe 'powerSet' {
    it 'should calculate power set of given set' {
        $powerSets1 = powerSet @(1)
        $powerSets2 = powerSet @(1, 2, 3)

        $powerSets1 | Should Be @(
            @()
            @(1)
        )

        $powerSets2 | Should Be @(
            @()
            @(1)
            @(2)
            @(1, 2)
            @(3)
            @(1, 3)
            @(2, 3)
            @(1, 2, 3)
        )
    }
}