. $PSScriptRoot\..\trialDivision.ps1

function primalityTest($testFunction) {

    & $testFunction 1 | Should Be $false
    & $testFunction 1 | Should Be $false
    & $testFunction 2 | Should Be $true
    & $testFunction 3 | Should Be $true
    & $testFunction 5 | Should Be $true
    & $testFunction 11 | Should Be $true
    & $testFunction 191 | Should Be $true
    & $testFunction 191 | Should Be $true
    & $testFunction 199 | Should Be $true

    & $testFunction -1 | Should Be $false

    & $testFunction 0 | Should Be $false
    & $testFunction 4 | Should Be $false
    & $testFunction 6 | Should Be $false
    & $testFunction 12 | Should Be $false
    & $testFunction 14 | Should Be $false
    & $testFunction 25 | Should Be $false
    & $testFunction 192 | Should Be $false
    & $testFunction 200 | Should Be $false
    & $testFunction 400 | Should Be $false

    # # It should also deal with floats.
    & $testFunction 0.5 | Should Be $false
    & $testFunction 1.3 | Should Be $false
    & $testFunction 10.5 | Should Be $false
}

describe 'trialDivision' {
    it 'should detect prime numbers' {
        primalityTest trialDivision
    }
}