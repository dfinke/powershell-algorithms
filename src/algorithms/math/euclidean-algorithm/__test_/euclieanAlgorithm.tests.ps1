. $PSScriptRoot\..\euclideanAlgorithm.ps1

describe 'euclideanAlgorithm' {
    it 'should calculate GCD' {
        euclideanAlgorithm 0 0 | Should Be $null
        euclideanAlgorithm 2 0 | Should Be 2
        euclideanAlgorithm 0 2 | Should Be 2
        euclideanAlgorithm 1 2 | Should Be 1
        euclideanAlgorithm 2 1 | Should Be 1
        euclideanAlgorithm 6 6 | Should Be 6
        euclideanAlgorithm 2 4 | Should Be 2
        euclideanAlgorithm 4 2 | Should Be 2
        euclideanAlgorithm 12 4 | Should Be 4
        euclideanAlgorithm 4 12 | Should Be 4
        euclideanAlgorithm 5 13 | Should Be 1
        euclideanAlgorithm 27 13 | Should Be 1
        euclideanAlgorithm 24 60 | Should Be 12
        euclideanAlgorithm 60 24 | Should Be 12
        euclideanAlgorithm 252 105 | Should Be 21
        euclideanAlgorithm 105 252 | Should Be 21
        euclideanAlgorithm 1071 462 | Should Be 21
        euclideanAlgorithm 462 1071 | Should Be 21
        euclideanAlgorithm 462 -1071 | Should Be 21
        euclideanAlgorithm -462 -1071 | Should Be 21
    }
}