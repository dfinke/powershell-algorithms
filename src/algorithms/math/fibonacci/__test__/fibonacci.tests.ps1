Import-Module $PSScriptRoot\..\fibonacci.psm1 -Force

Describe 'fibonacci' {
    it 'should calculate fibonacci correctly' {
        fibonacci 1 | Should be 1
        fibonacci 2 | Should be 1, 1
        fibonacci 3 | Should be 1, 1, 2
        fibonacci 4 | Should be 1, 1, 2, 3
        fibonacci 5 | Should be 1, 1, 2, 3, 5
        fibonacci 6 | Should be 1, 1, 2, 3, 5, 8
        fibonacci 7 | Should be 1, 1, 2, 3, 5, 8, 13
        fibonacci 8 | Should be 1, 1, 2, 3, 5, 8, 13, 21
    }
}