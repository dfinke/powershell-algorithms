. $PSScriptRoot\..\DisjointSet.ps1

describe 'DisjointSet' {
    it 'should throw error when trying to union and check not existing sets' {
        function mergeNotExistingSets {
            $disjointSet = New-Object DisjointSet

            $disjointSet.union('A', 'B')
        }

        function checkNotExistingSets {
            $disjointSet = New-Object DisjointSet

            $disjointSet.inSameSet('A', 'B');
        }

        {mergeNotExistingSets} | Should  Throw 'One or two values are not in sets'
        {checkNotExistingSets} | Should Throw 'One or two values are not in sets'
    }

    it 'should do basic manipulations on disjoint set' {
        $disjointSet = New-Object DisjointSet

        $disjointSet.find('A') | Should Be $null
        $disjointSet.find('B') | Should Be $null

        $disjointSet.makeSet('A')

        $disjointSet.find('A') | Should Be 'A'
        $disjointSet.find('B') | Should Be $null

        $disjointSet.makeSet('B')

        $disjointSet.find('A') | Should Be 'A'
        $disjointSet.find('B') | Should Be 'B'

        $disjointSet.makeSet('C')

        $disjointSet.inSameSet('A', 'B') | Should Be $false

        $disjointSet.union('A', 'B')

        $disjointSet.find('A') | Should Be 'A'
        $disjointSet.find('B') | Should Be 'A'
        $disjointSet.inSameSet('A', 'B') | Should Be $true
        $disjointSet.inSameSet('B', 'A') | Should Be $true
        $disjointSet.inSameSet('A', 'C') | Should Be $false

        $disjointSet.union('A', 'A')

        $disjointSet.union('B', 'C')

        $disjointSet.find('A') | Should Be 'A'
        $disjointSet.find('B') | Should Be 'A'
        $disjointSet.find('C') | Should Be 'A'

        $disjointSet.inSameSet('A', 'B') | Should Be $true
        $disjointSet.inSameSet('B', 'C') | Should Be $true
        $disjointSet.inSameSet('A', 'C') | Should Be $true

        $disjointSet.
        makeSet('E').
        makeSet('F').
        makeSet('G').
        makeSet('H').
        makeSet('I')

        $disjointSet.
        union('E', 'F').
        union('F', 'G').
        union('G', 'H').
        union('H', 'I')

        $disjointSet.inSameSet('A', 'I') | Should Be $false
        $disjointSet.inSameSet('E', 'I') | Should Be $true

        $disjointSet.union('I', 'C')

        $disjointSet.find('I') | Should Be 'E'
        $disjointSet.inSameSet('A', 'I') | Should Be $true
    }

    it 'should union smaller set with bigger one making bigger one to be new root' {
        $disjointSet = New-Object DisjointSet

        $disjointSet.
        makeSet('A').
        makeSet('B').
        makeSet('C').
        union('B', 'C').
        union('A', 'C')

        $disjointSet.find('A') | Should Be 'B'
    }

    it 'should do basic manipulations on disjoint set with custom key extractor' {
        $keyExtractor = {
            param($value)
            $value.key
        }

        $disjointSet = New-Object DisjointSet $keyExtractor

        $itemA = @{ key = 'A'; value = 1 }
        $itemB = @{ key = 'B'; value = 2 }
        $itemC = @{ key = 'C'; value = 3 }

        $disjointSet.find($itemA) | Should Be $null
        $disjointSet.find($itemB) | Should Be $null

        $disjointSet.makeSet($itemA)

        $disjointSet.find($itemA) | Should Be 'A'
        $disjointSet.find($itemB) | Should Be $null

        $disjointSet.makeSet($itemB)

        $disjointSet.find($itemA) | Should Be 'A'
        $disjointSet.find($itemB) | Should Be 'B'

        $disjointSet.makeSet($itemC)

        $disjointSet.inSameSet($itemA, $itemB) | Should Be $false

        $disjointSet.union($itemA, $itemB)

        $disjointSet.find($itemA) | Should Be 'A'
        $disjointSet.find($itemB) | Should Be 'A'
        $disjointSet.inSameSet($itemA, $itemB) | Should Be $true
        $disjointSet.inSameSet($itemB, $itemA) | Should Be $true
        $disjointSet.inSameSet($itemA, $itemC) | Should Be $false

        $disjointSet.union($itemA, $itemC)

        $disjointSet.find($itemA) | Should Be 'A'
        $disjointSet.find($itemB) | Should Be 'A'
        $disjointSet.find($itemC) | Should Be 'A'

        $disjointSet.inSameSet($itemA, $itemB) | Should Be $true
        $disjointSet.inSameSet($itemB, $itemC) | Should Be $true
        $disjointSet.inSameSet($itemA, $itemC) | Should Be $true
    }
}
