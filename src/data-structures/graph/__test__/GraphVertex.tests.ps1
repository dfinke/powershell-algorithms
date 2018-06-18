. $PSScriptRoot\..\GraphVertex.ps1
. $PSScriptRoot\..\GraphEdge.ps1

describe 'GraphVertex' {
    it 'should throw an error when trying to create vertex without value' {
        $vertex = $null

        function createEmptyVertex {
            $vertex = New-Object GraphVertex
        }

        $vertex | Should Be $null
        {createEmptyVertex} | Should Throw 'Graph vertex must have a value'
    }

    it 'should create graph vertex' {
        $vertex = New-Object GraphVertex('A')

        $vertex | Should Not Be $null

        $vertex.value | Should Be 'A'
        $vertex.toString() | Should Be 'A'
        $vertex.getKey() | Should Be 'A'
        $vertex.edges.toString() | Should Be ''
        $vertex.getEdges() | Should Be @()
    }

    it 'should add edges to vertex and check if it exists' {
        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'

        $edgeAB = New-Object GraphEdge $vertexA, $vertexB
        $vertexA.addEdge($edgeAB)

        $vertexA.hasEdge($edgeAB) | Should Be $true
        $vertexB.hasEdge($edgeAB) | Should Be $false
        $vertexA.getEdges().Count | Should Be 1

        #$vertexA.getEdges()[0].toString() | Should Be 'A_B'
    }

    it 'should delete edges from vertex' {
        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'
        $vertexC = New-Object GraphVertex 'C'

        $edgeAB = New-Object GraphEdge $vertexA, $vertexB
        $edgeAC = New-Object GraphEdge $vertexA, $vertexC

        $vertexA.
            addEdge($edgeAB).
            addEdge($edgeAC)

        $vertexA.hasEdge($edgeAB) | Should Be $true
        $vertexB.hasEdge($edgeAB) | Should Be $false

        $vertexA.hasEdge($edgeAC) | Should Be $true
        $vertexC.hasEdge($edgeAC) | Should Be $false

        $vertexA.getEdges().Count | Should Be 2

        # expect(vertexA.getEdges()[0].toString()).toBe('A_B');
        # expect(vertexA.getEdges()[1].toString()).toBe('A_C');

        $vertexA.deleteEdge($edgeAB)
        $vertexA.hasEdge($edgeAB) | Should Be $false
        $vertexA.hasEdge($edgeAC) | Should Be $true

        # expect(vertexA.getEdges()[0].toString()).toBe('A_C');

        $vertexA.deleteEdge($edgeAC)
        $vertexA.hasEdge($edgeAB) | Should Be $false
        $vertexA.hasEdge($edgeAC) | Should Be $false
        $vertexA.getEdges().Count | Should Be 0
    }

    it 'should delete all edges from vertex' {
        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'
        $vertexC = New-Object GraphVertex 'C'

        $edgeAB = New-Object GraphEdge $vertexA, $vertexB
        $edgeAC = New-Object GraphEdge $vertexA, $vertexC

        $vertexA.
            addEdge($edgeAB).
            addEdge($edgeAC)

        $vertexA.hasEdge($edgeAB) | Should Be $true
        $vertexB.hasEdge($edgeAB) | Should Be $false

        $vertexA.hasEdge($edgeAC) | Should Be $true
        $vertexC.hasEdge($edgeAC) | Should Be $false

        $vertexA.getEdges().Count | Should Be 2

        $vertexA.deleteAllEdges()

        $vertexA.hasEdge($edgeAB) | Should Be $false
        $vertexB.hasEdge($edgeAB) | Should Be $false

        $vertexA.hasEdge($edgeAC) | Should Be $false
        $vertexC.hasEdge($edgeAC) | Should Be $false

        $vertexA.getEdges().Count | Should Be 0
    }

    it 'should return vertex neighbors in case if current node is start one' {
        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'
        $vertexC = New-Object GraphVertex 'C'

        $edgeAB = New-Object GraphEdge $vertexA, $vertexB
        $edgeAC = New-Object GraphEdge $vertexA, $vertexC

        $vertexA.
            addEdge($edgeAB).
            addEdge($edgeAC)

        $vertexB.getNeighbors() | Should Be @()

        $neighbors = $vertexA.getNeighbors()

        $neighbors.Count | Should Be 2
        $neighbors[0] | Should Be $vertexB
        $neighbors[1] | Should Be $vertexC
    }

    it 'should return vertex neighbors in case if current node is end one' {
        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'
        $vertexC = New-Object GraphVertex 'C'

        $edgeBA = New-Object GraphEdge $vertexB, $vertexA
        $edgeCA = New-Object GraphEdge $vertexC, $vertexA

        $vertexA.
            addEdge($edgeBA).
            addEdge($edgeCA)

        $vertexB.getNeighbors() | Should Be @()

        $neighbors = $vertexA.getNeighbors()

        $neighbors.Count | Should Be 2
        $neighbors[0] | Should Be $vertexB
        $neighbors[1] | Should Be $vertexC
    }

    it 'should check if vertex has specific neighbor' {
        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'
        $vertexC = New-Object GraphVertex 'C'

        $edgeAB = New-Object GraphEdge $vertexA, $vertexB
        $vertexA.addEdge($edgeAB)

        $vertexA.hasNeighbor($vertexB) | Should Be $true
        $vertexA.hasNeighbor($vertexC) | Should Be $false
    }

    it 'should edge by vertex' {
        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'
        $vertexC = New-Object GraphVertex 'C'

        $edgeAB = New-Object GraphEdge $vertexA, $vertexB
        $vertexA.addEdge($edgeAB)

        $vertexA.findEdge($vertexB) | Should Be $edgeAB
        $vertexA.findEdge($vertexC) | Should Be $null
    }

    it 'should calculate vertex degree' {
        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'

        $vertexA.getDegree() | Should Be 0

        $edgeAB = New-Object GraphEdge $vertexA, $vertexB
        $vertexA.addEdge($edgeAB)

        $vertexA.getDegree() | Should Be 1

        $edgeBA = New-Object GraphEdge $vertexB, $vertexA
        $vertexA.addEdge($edgeBA)

        $vertexA.getDegree() | Should Be 2

        $vertexA.addEdge($edgeAB)
        $vertexA.getDegree() | Should Be 3

        $vertexA.getEdges().Count | Should Be 3
    }
}
