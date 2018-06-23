. $PSScriptRoot\..\permutateWithRepetitions.ps1

describe 'permutateWithRepetitions' {
    it 'should permutate string with repetition' {
        $permutations0 = permutateWithRepetitions @()
        $permutations0 | Should Be @()

        $permutations1 = permutateWithRepetitions @('A')
        $permutations1 | Should Be @(@('A'))

        $permutations2 = permutateWithRepetitions @('A', 'B')
        $permutations2 | Should Be @(
            'AA'
            'AB'
            'BA'
            'BB'
        )

        $permutations3 = permutateWithRepetitions @('A', 'B', 'C')
        $permutations3 | Should Be @(
            'AAA'
            'AAB'
            'AAC'
            'ABA'
            'ABB'
            'ABC'
            'ACA'
            'ACB'
            'ACC'
            'BAA'
            'BAB'
            'BAC'
            'BBA'
            'BBB'
            'BBC'
            'BCA'
            'BCB'
            'BCC'
            'CAA'
            'CAB'
            'CAC'
            'CBA'
            'CBB'
            'CBC'
            'CCA'
            'CCB'
            'CCC'
        )
        # $permutations3 | Should Be @(
        #   @('A', 'A', 'A')
        #   @('A', 'A', 'B')
        #   @('A', 'A', 'C')
        #   @('A', 'B', 'A')
        #   @('A', 'B', 'B')
        #   @('A', 'B', 'C')
        #   @('A', 'C', 'A')
        #   @('A', 'C', 'B')
        #   @('A', 'C', 'C')
        #   @('B', 'A', 'A')
        #   @('B', 'A', 'B')
        #   @('B', 'A', 'C')
        #   @('B', 'B', 'A')
        #   @('B', 'B', 'B')
        #   @('B', 'B', 'C')
        #   @('B', 'C', 'A')
        #   @('B', 'C', 'B')
        #   @('B', 'C', 'C')
        #   @('C', 'A', 'A')
        #   @('C', 'A', 'B')
        #   @('C', 'A', 'C')
        #   @('C', 'B', 'A')
        #   @('C', 'B', 'B')
        #   @('C', 'B', 'C')
        #   @('C', 'C', 'A')
        #   @('C', 'C', 'B')
        #   @('C', 'C', 'C')
        # )

        $permutations4 = permutateWithRepetitions @('A', 'B', 'C', 'D')
        $permutations4.Count | Should Be (4 * 4 * 4 * 4)
    }
}
