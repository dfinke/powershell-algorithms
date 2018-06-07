Import-Module $PSScriptRoot\..\levenshteinDistance.psm1 -Force

describe 'levenshteinDistance' {
    it 'should calculate edit distance between two strings' {
        levenshteinDistance '' '' | Should Be 0
        levenshteinDistance 'a' '' | Should Be 1
        levenshteinDistance '' 'a' | Should Be 1
        levenshteinDistance 'abc' '' | Should Be 3
        levenshteinDistance '' 'abc' | Should Be 3

        # // Should just add I to the beginning.
        levenshteinDistance 'islander' 'slander' | Should Be 1

        # // Needs to substitute M by K, T by M and add an A to the end
        levenshteinDistance 'mart' 'karma' | Should Be 3

        # // Substitute K by S, E by I and insert G at the end.
        levenshteinDistance 'kitten' 'sitting' | Should Be 3

        # // Should add 4 letters FOOT at the beginning.
        levenshteinDistance 'ball' 'football' | Should Be 4

        # // Should delete 4 letters FOOT at the beginning.
        levenshteinDistance 'football' 'foot' | Should Be 4

        # // Needs to substitute the first 5 chars: INTEN by EXECU
        levenshteinDistance 'intention' 'execution' | Should Be 5
    }
}