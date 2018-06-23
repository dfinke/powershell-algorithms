. $PSScriptRoot\..\permutateWithoutRepetitions.ps1
. $PSScriptRoot\..\..\..\math\factorial\factorial.ps1

describe 'permutateWithoutRepetitions' {
    it 'should permutate string' {
        $permutations0 = permutateWithoutRepetitions @()
        $permutations0 | Should Be @()

        $permutations1 = permutateWithoutRepetitions @('A')
        $permutations1 | Should Be @(@('A'))

        # $permutations2 = permutateWithoutRepetitions @('A', 'B')
        # $permutations2.Count | Should Be 2
        # $permutations2 | Should Be @(
        #   'BA'
        #   'AB'
        # )

        # $permutations6 = permutateWithoutRepetitions(['A', 'A']
        # expect(permutations6.length).toBe(2);
        # expect(permutations6).toEqual([
        #   ['A', 'A'],
        #   ['A', 'A'],
        # ]);

        # $permutations3 = permutateWithoutRepetitions(['A', 'B', 'C']
        # expect(permutations3.length).toBe(factorial(3));
        # expect(permutations3).toEqual([
        #   ['C', 'B', 'A'],
        #   ['B', 'C', 'A'],
        #   ['B', 'A', 'C'],
        #   ['C', 'A', 'B'],
        #   ['A', 'C', 'B'],
        #   ['A', 'B', 'C'],
        # ]);

        # $permutations4 = permutateWithoutRepetitions(['A', 'B', 'C', 'D']
        # expect(permutations4.length).toBe(factorial(4));
        # expect(permutations4).toEqual([
        #   ['D', 'C', 'B', 'A'],
        #   ['C', 'D', 'B', 'A'],
        #   ['C', 'B', 'D', 'A'],
        #   ['C', 'B', 'A', 'D'],
        #   ['D', 'B', 'C', 'A'],
        #   ['B', 'D', 'C', 'A'],
        #   ['B', 'C', 'D', 'A'],
        #   ['B', 'C', 'A', 'D'],
        #   ['D', 'B', 'A', 'C'],
        #   ['B', 'D', 'A', 'C'],
        #   ['B', 'A', 'D', 'C'],
        #   ['B', 'A', 'C', 'D'],
        #   ['D', 'C', 'A', 'B'],
        #   ['C', 'D', 'A', 'B'],
        #   ['C', 'A', 'D', 'B'],
        #   ['C', 'A', 'B', 'D'],
        #   ['D', 'A', 'C', 'B'],
        #   ['A', 'D', 'C', 'B'],
        #   ['A', 'C', 'D', 'B'],
        #   ['A', 'C', 'B', 'D'],
        #   ['D', 'A', 'B', 'C'],
        #   ['A', 'D', 'B', 'C'],
        #   ['A', 'B', 'D', 'C'],
        #   ['A', 'B', 'C', 'D'],
        # ]);

        # $permutations5 = permutateWithoutRepetitions(['A', 'B', 'C', 'D', 'E''F']);
        # expect(permutations5.length).toBe(factorial(6));
    }
}