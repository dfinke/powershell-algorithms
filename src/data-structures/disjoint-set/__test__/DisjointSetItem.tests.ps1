. $PSScriptRoot\..\DisjointSetItem.ps1

describe 'DisjointSetItem' {
    it 'should do basic manipulation with disjoint set item' {
        $itemA = New-Object DisjointSetItem('A')
        $itemB = New-Object DisjointSetItem('B')
        $itemC = New-Object DisjointSetItem('C')
        $itemD = New-Object DisjointSetItem('D')

        $itemA.getRank() | Should Be 0
        $itemA.getChildren() | Should Be @()
        $itemA.getKey() | Should Be 'A'
        $itemA.getRoot() | Should Be $itemA
        $itemA.isRoot() | Should Be $true
        $itemB.isRoot() | Should Be $true

        $itemA.addChild($itemB)
        $itemD.setParent($itemC)

        $itemA.getRank() | Should Be 1
        $itemC.getRank() | Should Be 1

        $itemB.getRank() | Should Be 0
        $itemD.getRank() | Should Be 0

        $itemA.getChildren().Count | Should Be 1
        $itemC.getChildren().Count | Should Be 1

        $itemA.getChildren()[0] | Should Be $itemB
        $itemC.getChildren()[0] | Should Be $itemD

        $itemB.getChildren().Count | Should Be 0
        $itemD.getChildren().Count | Should Be 0

        $itemA.getRoot() | Should Be $itemA
        $itemB.getRoot() | Should Be $itemA

        $itemC.getRoot() | Should Be $itemC
        $itemD.getRoot() | Should Be $itemC

        $itemA.isRoot() | Should Be $true
        $itemB.isRoot() | Should Be $false
        $itemC.isRoot() | Should Be $true
        $itemD.isRoot() | Should Be $false

        $itemA.addChild($itemC)

        $itemA.isRoot() | Should Be $true
        $itemB.isRoot() | Should Be $false
        $itemC.isRoot() | Should Be $false
        $itemD.isRoot() | Should Be $false

        $itemA.getRank() | Should Be 3
        $itemB.getRank() | Should Be 0
        $itemC.getRank() | Should Be 1
    }

    it 'should do basic manipulation with disjoint set item with custom key extractor' {
        $keyExtractor = {
            param($value)

            $value.key
        }

        $itemA = New-Object DisjointSetItem(@{ key = 'A'; value = 1 }, $keyExtractor)
        $itemB = New-Object DisjointSetItem(@{ key = 'B'; value = 2 }, $keyExtractor)
        $itemC = New-Object DisjointSetItem(@{ key = 'C'; value = 3 }, $keyExtractor)
        $itemD = New-Object DisjointSetItem(@{ key = 'D'; value = 4 }, $keyExtractor)

        $itemA.getRank() | Should Be 0
        $itemA.getChildren() | Should Be @()
        $itemA.getKey() | Should Be 'A'
        $itemA.getRoot() | Should Be $itemA
        $itemA.isRoot() | Should Be $true
        $itemB.isRoot() | Should Be $true

        $itemA.addChild($itemB)
        $itemD.setParent($itemC)

        $itemA.getRank() | Should Be 1
        $itemC.getRank() | Should Be 1

        $itemB.getRank() | Should Be 0
        $itemD.getRank() | Should Be 0

        $itemA.getChildren().Count | Should Be 1
        $itemC.getChildren().Count | Should Be 1

        $itemA.getChildren()[0] | Should Be $itemB
        $itemC.getChildren()[0] | Should Be $itemD

        $itemB.getChildren().Count | Should Be 0
        $itemD.getChildren().Count | Should Be 0

        $itemA.getRoot() | Should Be $itemA
        $itemB.getRoot() | Should Be $itemA

        $itemC.getRoot() | Should Be $itemC
        $itemD.getRoot() | Should Be $itemC

        $itemA.isRoot() | Should Be $true
        $itemB.isRoot() | Should Be $false
        $itemC.isRoot() | Should Be $true
        $itemD.isRoot() | Should Be $false

        $itemA.addChild($itemC)

        $itemA.isRoot() | Should Be $true

        $itemB.isRoot() | Should Be $false
        $itemC.isRoot() | Should Be $false
        $itemD.isRoot() | Should Be $false

        $itemA.getRank() | Should Be 3
        $itemB.getRank() | Should Be 0
        $itemC.getRank() | Should Be 1
    }
}
