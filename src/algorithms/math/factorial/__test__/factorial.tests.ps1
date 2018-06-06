. $PSScriptRoot\..\factorial.ps1

describe 'factorial' {
    it 'should calculate factorial' {
        factorial 0 | Should Be 1
        factorial 1 | Should Be 1
        factorial 5 | Should Be 120
        factorial 8 | Should Be 40320
        factorial 10 | Should Be 3628800
    }
}