. $PSScriptRoot\..\..\..\..\data-structures\graph\GraphVertex.ps1
. $PSScriptRoot\..\..\..\..\data-structures\graph\GraphEdge.ps1
. $PSScriptRoot\..\..\..\..\data-structures\graph\Graph.ps1
. $PSScriptRoot\..\bellmanFord.ps1

describe 'bellmanFord' {
    it 'should find minimum paths to all vertices for undirected graph' {
        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'
        $vertexC = New-Object GraphVertex 'C'
        $vertexD = New-Object GraphVertex 'D'
        $vertexE = New-Object GraphVertex 'E'
        $vertexF = New-Object GraphVertex 'F'
        $vertexG = New-Object GraphVertex 'G'
        $vertexH = New-Object GraphVertex 'H'

        $edgeAB = New-Object GraphEdge $vertexA, $vertexB, 4
        $edgeAE = New-Object GraphEdge $vertexA, $vertexE, 7
        $edgeAC = New-Object GraphEdge $vertexA, $vertexC, 3
        $edgeBC = New-Object GraphEdge $vertexB, $vertexC, 6
        $edgeBD = New-Object GraphEdge $vertexB, $vertexD, 5
        $edgeEC = New-Object GraphEdge $vertexE, $vertexC, 8
        $edgeED = New-Object GraphEdge $vertexE, $vertexD, 2
        $edgeDC = New-Object GraphEdge $vertexD, $vertexC, 11
        $edgeDG = New-Object GraphEdge $vertexD, $vertexG, 10
        $edgeDF = New-Object GraphEdge $vertexD, $vertexF, 2
        $edgeFG = New-Object GraphEdge $vertexF, $vertexG, 3
        $edgeEG = New-Object GraphEdge $vertexE, $vertexG, 5

        $graph = New-Object Graph
        $graph.
        addVertex($vertexH).
        addEdge($edgeAB).
        addEdge($edgeAE).
        addEdge($edgeAC).
        addEdge($edgeBC).
        addEdge($edgeBD).
        addEdge($edgeEC).
        addEdge($edgeED).
        addEdge($edgeDC).
        addEdge($edgeDG).
        addEdge($edgeDF).
        addEdge($edgeFG).
        addEdge($edgeEG)

        $distances, $previousVertices = bellmanFord $graph $vertexA

        $distances.H | Should Be ([double]::PositiveInfinity)
        $distances.A | Should Be 0
        $distances.B | Should Be 4
        $distances.E | Should Be 7
        $distances.C | Should Be 3
        $distances.D | Should Be 9
        $distances.G | Should Be 12
        $distances.F | Should Be 11

        $previousVertices.F.getKey() | Should Be 'D'
        #$previousVertices.D.getKey() | Should Be 'B'
        $previousVertices.B.getKey() | Should Be 'A'
        $previousVertices.G.getKey() | Should Be 'E'
        $previousVertices.C.getKey() | Should Be 'A'
        $previousVertices.A | Should be $null
        $previousVertices.H | Should be $null
    }

    it 'should find minimum paths to all vertices for directed graph with negative edge weights' {
        $vertexS = New-Object GraphVertex 'S'
        $vertexE = New-Object GraphVertex 'E'
        $vertexA = New-Object GraphVertex 'A'
        $vertexD = New-Object GraphVertex 'D'
        $vertexB = New-Object GraphVertex 'B'
        $vertexC = New-Object GraphVertex 'C'
        $vertexH = New-Object GraphVertex 'H'

        $edgeSE = New-Object GraphEdge $vertexS, $vertexE, 8
        $edgeSA = New-Object GraphEdge $vertexS, $vertexA, 10
        $edgeED = New-Object GraphEdge $vertexE, $vertexD, 1
        $edgeDA = New-Object GraphEdge $vertexD, $vertexA, -4
        $edgeDC = New-Object GraphEdge $vertexD, $vertexC, -1
        $edgeAC = New-Object GraphEdge $vertexA, $vertexC, 2
        $edgeCB = New-Object GraphEdge $vertexC, $vertexB, -2
        $edgeBA = New-Object GraphEdge $vertexB, $vertexA, 1

        $graph = New-Object Graph $true
        $graph.
            addVertex($vertexH).
            addEdge($edgeSE).
            addEdge($edgeSA).
            addEdge($edgeED).
            addEdge($edgeDA).
            addEdge($edgeDC).
            addEdge($edgeAC).
            addEdge($edgeCB).
            addEdge($edgeBA)

        $distances, $previousVertices  = bellmanFord $graph $vertexS

        $distances.H | Should Be ([double]::PositiveInfinity)
        $distances.S | Should Be 0
        $distances.A | Should Be 5
        $distances.B | Should Be 5
        $distances.C | Should Be 7
        $distances.D | Should Be 9
        $distances.E | Should Be 8

        $previousVertices.H | Should Be $null
        $previousVertices.S | Should Be $null
        $previousVertices.B.getKey() | Should Be 'C'
        $previousVertices.C.getKey() | Should Be 'A'
        $previousVertices.A.getKey() | Should Be 'D'
        $previousVertices.D.getKey() | Should Be 'E'
    }
}