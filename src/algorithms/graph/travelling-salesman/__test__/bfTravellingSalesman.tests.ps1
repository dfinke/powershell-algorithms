. $PSScriptRoot\..\..\..\..\data-structures\graph\GraphVertex.ps1
. $PSScriptRoot\..\..\..\..\data-structures\graph\GraphEdge.ps1
. $PSScriptRoot\..\..\..\..\data-structures\graph\Graph.ps1
. $PSScriptRoot\..\bfTravellingSalesman.ps1

describe 'bfTravellingSalesman' {
    it 'should solve problem for simple graph' {
        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'
        $vertexC = New-Object GraphVertex 'C'
        $vertexD = New-Object GraphVertex 'D'

        $edgeAB = New-Object GraphEdge $vertexA, $vertexB, 1
        $edgeBD = New-Object GraphEdge $vertexB, $vertexD, 1
        $edgeDC = New-Object GraphEdge $vertexD, $vertexC, 1
        $edgeCA = New-Object GraphEdge $vertexC, $vertexA, 1

        $edgeBA = New-Object GraphEdge $vertexB, $vertexA, 5
        $edgeDB = New-Object GraphEdge $vertexD, $vertexB, 8
        $edgeCD = New-Object GraphEdge $vertexC, $vertexD, 7
        $edgeAC = New-Object GraphEdge $vertexA, $vertexC, 4
        $edgeAD = New-Object GraphEdge $vertexA, $vertexD, 2
        $edgeDA = New-Object GraphEdge $vertexD, $vertexA, 3
        $edgeBC = New-Object GraphEdge $vertexB, $vertexC, 3
        $edgeCB = New-Object GraphEdge $vertexC, $vertexB, 9

        $graph = New-Object Graph $true
        $graph.
        addEdge($edgeAB).
        addEdge($edgeBD).
        addEdge($edgeDC).
        addEdge($edgeCA).
        addEdge($edgeBA).
        addEdge($edgeDB).
        addEdge($edgeCD).
        addEdge($edgeAC).
        addEdge($edgeAD).
        addEdge($edgeDA).
        addEdge($edgeBC).
        addEdge($edgeCB)

        # $salesmanPath = bfTravellingSalesman $graph
        # $salesmanPath | Should Be 4

        # salesmanPath[0].getKey() | Should Be $vertexA.getKey()
        # salesmanPath[1].getKey() | Should Be $vertexB.getKey()
        # salesmanPath[2].getKey() | Should Be $vertexD.getKey()
        # salesmanPath[3].getKey() | Should Be $vertexC.getKey()
    }
}
