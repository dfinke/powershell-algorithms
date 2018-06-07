. $PSScriptRoot\..\hammingDistance.ps1

describe 'hammingDistance' {
    it 'should throw an error when trying to compare the strings of different lengths' {
        function compareStringsOfDifferentLength  {
            hammingDistance 'a' 'aa'
        }

        {compareStringsOfDifferentLength} | Should Throw 'Strings must be of the same length'
    }

    it 'should calculate difference between two strings' {
        hammingDistance 'a' 'a' | Should Be 0
        hammingDistance 'a' 'b' | Should Be 1
        hammingDistance 'abc' 'add' | Should Be 2
        hammingDistance 'karolin' 'kathrin' | Should Be 3
        hammingDistance 'karolin' 'kerstin' | Should Be 3
        hammingDistance '1011101' '1001001' | Should Be 2
        hammingDistance '2173896' '2233796' | Should Be 3
    }
}