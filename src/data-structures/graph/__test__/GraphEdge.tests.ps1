. $PSScriptRoot\..\GraphVertex.ps1
. $PSScriptRoot\..\GraphEdge.ps1

describe 'GraphEdge' {
    it 'should create graph edge with default weight' {
        $startVertex = New-Object GraphVertex 'A'
        $endVertex = New-Object GraphVertex 'B'
        $edge = New-Object GraphEdge $startVertex, $endVertex

        $edge.getKey() | Should Be 'A_B'
        $edge.toString() | Should Be 'A_B'

        $edge.startVertex | Should Be $startVertex
        $edge.endVertex | Should Be $endVertex
        $edge.weight | Should Be 0
    }

    it 'should create graph edge with predefined weight' {
        $startVertex = New-Object GraphVertex 'A'
        $endVertex = New-Object GraphVertex 'B'
        $edge = New-Object GraphEdge $startVertex, $endVertex, 10

        $edge.startVertex | Should Be $startVertex
        $edge.endVertex | Should Be $endVertex
        $edge.weight | Should Be 10
    }

    it 'should be possible to do edge reverse' {
        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'
        $edge = New-Object GraphEdge $vertexA, $vertexB, 10

        $edge.startVertex | Should Be $vertexA
        $edge.endVertex | Should Be $vertexB
        $edge.weight | Should Be 10

        $edge.reverse()

        $edge.startVertex | Should Be $vertexB
        $edge.endVertex | Should Be $vertexA
        $edge.weight | Should Be 10
    }
}
