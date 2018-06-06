. $PSScriptRoot\..\leastCommonMultiple.ps1

describe 'leastCommonMultiple' {
    it 'should find least common multiple' {
        leastCommonMultiple 0 0 | Should Be 0
        leastCommonMultiple 1 0 | Should Be 0
        leastCommonMultiple 0 1 | Should Be 0
        leastCommonMultiple 4 6 | Should Be 12
        leastCommonMultiple 6 21 | Should Be 42
        leastCommonMultiple 7 2 | Should Be 14
        leastCommonMultiple 3 5 | Should Be 15
        leastCommonMultiple 7 3 | Should Be 21
        leastCommonMultiple 1000000 2 | Should Be 1000000
        leastCommonMultiple -9 -18 | Should Be 18
        leastCommonMultiple -7 -9 | Should Be 63
        leastCommonMultiple -7 9 | Should Be 63
    }
}