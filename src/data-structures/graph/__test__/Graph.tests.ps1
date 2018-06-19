. $PSScriptRoot\..\Graph.ps1
. $PSScriptRoot\..\GraphVertex.ps1
. $PSScriptRoot\..\GraphEdge.ps1

describe 'Graph' {
    it 'should add vertices to graph' {
        $graph = New-Object Graph

        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'

        $graph.
        addVertex($vertexA).
        addVertex($vertexB)

        $graph.toString() | Should Be 'A,B'
        $graph.getVertexByKey($vertexA.getKey()) | Should Be $vertexA
        $graph.getVertexByKey($vertexB.getKey()) | Should Be $vertexB
    }

    it 'should add edges to undirected graph' {
        $graph = New-Object Graph

        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'

        $edgeAB = New-Object GraphEdge $vertexA, $vertexB

        $graph.addEdge($edgeAB)

        $graph.getAllVertices().Count | Should Be 2
        $graph.getAllVertices()[0] | Should Be $vertexA
        $graph.getAllVertices()[1] | Should Be $vertexB

        $graphVertexA = $graph.findVertexByKey($vertexA.getKey())
        $graphVertexB = $graph.findVertexByKey($vertexB.getKey())

        $graph.toString() | Should Be 'A,B'
        $graphVertexA | Should Not Be $null
        $graphVertexB | Should Not Be $null

        $graph.findVertexByKey('not existing') | Should Be $null

        $graphVertexA.getNeighbors().Count | Should Be 1
        $graphVertexA.getNeighbors()[0] | Should Be $vertexB
        $graphVertexA.getNeighbors()[0] | Should Be $graphVertexB

        $graphVertexB.getNeighbors().Count | Should Be 1
        $graphVertexB.getNeighbors()[0] | Should Be $vertexA
        $graphVertexB.getNeighbors()[0] | Should Be $graphVertexA
    }

    it 'should add edges to directed graph' {
        $graph = New-Object Graph $true

        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'

        $edgeAB = New-Object GraphEdge $vertexA, $vertexB

        $graph.addEdge($edgeAB)

        $graphVertexA = $graph.findVertexByKey($vertexA.getKey())
        $graphVertexB = $graph.findVertexByKey($vertexB.getKey())

        $graph.toString()  | Should Be 'A,B'
        #$graphVertexA | Should Be $null
        #$graphVertexB | Should Be $null

        $graphVertexA | Should Not Be $null
        $graphVertexB | Should Not Be $null

        $graphVertexA.getNeighbors().Count | Should Be 1
        $graphVertexA.getNeighbors()[0] | Should Be $vertexB
        $graphVertexA.getNeighbors()[0] | Should Be $graphVertexB

        $graphVertexB.getNeighbors().Count | Should Be 0
    }

    it 'should find edge by vertices in undirected graph' {
        $graph = New-Object Graph

        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'
        $vertexC = New-Object GraphVertex 'C'

        $edgeAB = New-Object GraphEdge $vertexA, $vertexB, 10

        $graph.addEdge($edgeAB)

        $graphEdgeAB = $graph.findEdge($vertexA, $vertexB)
        $graphEdgeBA = $graph.findEdge($vertexB, $vertexA)
        $graphEdgeAC = $graph.findEdge($vertexB, $vertexC)

        $graphEdgeAC | Should Be $null
        $graphEdgeAB | Should Be $edgeAB
        $graphEdgeBA | Should Be $edgeAB
        $graphEdgeAB.weight | Should Be 10
    }

    it 'should find edge by vertices in directed graph' {
        $graph = New-Object Graph $true

        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'
        $vertexC = New-Object GraphVertex 'C'

        $edgeAB = New-Object GraphEdge $vertexA, $vertexB, 10

        $graph.addEdge($edgeAB)

        $graphEdgeAB = $graph.findEdge($vertexA, $vertexB)
        $graphEdgeBA = $graph.findEdge($vertexB, $vertexA)
        $graphEdgeAC = $graph.findEdge($vertexB, $vertexC)

        $graphEdgeAC | Should Be $null
        $graphEdgeBA | Should Be $null
        $graphEdgeAB | Should Be $edgeAB
        $graphEdgeAB.weight | Should Be 10
    }

    it 'should return vertex neighbors' {
        $graph = New-Object Graph $true

        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'
        $vertexC = New-Object GraphVertex 'C'

        $edgeAB = New-Object GraphEdge $vertexA, $vertexB
        $edgeAC = New-Object GraphEdge $vertexA, $vertexC

        $graph.
        addEdge($edgeAB).
        addEdge($edgeAC)

        $neighbors = $graph.getNeighbors($vertexA)

        $neighbors.Count | Should Be 2
        $neighbors[0] | Should Be $vertexB
        $neighbors[1] | Should Be $vertexC
    }

    it 'should throw an error when trying to add edge twice' {
        # function addSameEdgeTwice {
        #     $graph = New-Object Graph $true

        #     $vertexA = New-Object GraphVertex 'A'
        #     $vertexB = New-Object GraphVertex 'B'

        #     $edgeAB = New-Object GraphEdge $vertexA, $vertexB

        #     $graph.
        #       addEdge($edgeAB).
        #       addEdge($edgeAB)
        # }

        # {$addSameEdgeTwice} | Should Throw
    }

    it 'should return the list of all added edges' {
        $graph = New-Object Graph $true

        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'
        $vertexC = New-Object GraphVertex 'C'

        $edgeAB = New-Object GraphEdge $vertexA, $vertexB
        $edgeBC = New-Object GraphEdge $vertexB, $vertexC

        $graph.
          addEdge($edgeAB).
          addEdge($edgeBC)

        $edges = $graph.getAllEdges()

        $edges.Count | Should Be 2
        $edges[0] | Should Be $edgeAB
        $edges[1] | Should Be $edgeBC
    }

    it 'should calculate total graph weight for default graph' {
        $graph = New-Object Graph

        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'
        $vertexC = New-Object GraphVertex 'C'
        $vertexD = New-Object GraphVertex 'D'

        $edgeAB = New-Object GraphEdge $vertexA, $vertexB
        $edgeBC = New-Object GraphEdge $vertexB, $vertexC
        $edgeCD = New-Object GraphEdge $vertexC, $vertexD
        $edgeAD = New-Object GraphEdge $vertexA, $vertexD

        $graph.
          addEdge($edgeAB).
          addEdge($edgeBC).
          addEdge($edgeCD).
          addEdge($edgeAD)

        $graph.getWeight() | Should Be 0
    }

    it 'should calculate total graph weight for weighted graph' {
        $graph = New-Object Graph

        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'
        $vertexC = New-Object GraphVertex 'C'
        $vertexD = New-Object GraphVertex 'D'

        $edgeAB = New-Object GraphEdge $vertexA, $vertexB, 1
        $edgeBC = New-Object GraphEdge $vertexB, $vertexC, 2
        $edgeCD = New-Object GraphEdge $vertexC, $vertexD, 3
        $edgeAD = New-Object GraphEdge $vertexA, $vertexD, 4

        $graph.
          addEdge($edgeAB).
          addEdge($edgeBC).
          addEdge($edgeCD).
          addEdge($edgeAD)

        $graph.getWeight() | Should Be 10
    }

    it 'should be possible to delete edges from graph' {
        $graph = New-Object Graph

        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'
        $vertexC = New-Object GraphVertex 'C'

        $edgeAB = New-Object GraphEdge $vertexA, $vertexB
        $edgeBC = New-Object GraphEdge $vertexB, $vertexC
        $edgeAC = New-Object GraphEdge $vertexA, $vertexC

        $graph.
          addEdge($edgeAB).
          addEdge($edgeBC).
          addEdge($edgeAC)

        $graph.getAllEdges().Count | Should Be 3

        $graph.deleteEdge($edgeAB)

        $graph.getAllEdges().Count | Should Be 2
        $graph.getAllEdges()[0].getKey() | Should Be $edgeBC.getKey()
        $graph.getAllEdges()[1].getKey() | Should Be $edgeAC.getKey()
    }

    it 'should should throw an error when trying to delete not existing edge' {
        function deleteNotExistingEdge {
          $graph = New-Object Graph

          $vertexA = New-Object GraphVertex 'A'
          $vertexB = New-Object GraphVertex 'B'
          $vertexC = New-Object GraphVertex 'C'

          $edgeAB = New-Object GraphEdge $vertexA, $vertexB
          $edgeBC = New-Object GraphEdge $vertexB, $vertexC

          $graph.addEdge($edgeAB)
          $graph.deleteEdge($edgeBC)
        }

        {deleteNotExistingEdge} | Should Throw 'Edge not found in graph'
    }

    it 'should be possible to reverse graph' {
        # const vertexA = new GraphVertex('A');
        # const vertexB = new GraphVertex('B');
        # const vertexC = new GraphVertex('C');
        # const vertexD = new GraphVertex('D');

        # const edgeAB = new GraphEdge(vertexA, vertexB);
        # const edgeAC = new GraphEdge(vertexA, vertexC);
        # const edgeCD = new GraphEdge(vertexC, vertexD);

        # const graph = new Graph(true);
        # graph
        #   .addEdge(edgeAB)
        #   .addEdge(edgeAC)
        #   .addEdge(edgeCD);

        # expect(graph.toString()).toBe('A,B,C,D');
        # expect(graph.getAllEdges().length).toBe(3);
        # expect(graph.getNeighbors(vertexA).length).toBe(2);
        # expect(graph.getNeighbors(vertexA)[0].getKey()).toBe(vertexB.getKey());
        # expect(graph.getNeighbors(vertexA)[1].getKey()).toBe(vertexC.getKey());
        # expect(graph.getNeighbors(vertexB).length).toBe(0);
        # expect(graph.getNeighbors(vertexC).length).toBe(1);
        # expect(graph.getNeighbors(vertexC)[0].getKey()).toBe(vertexD.getKey());
        # expect(graph.getNeighbors(vertexD).length).toBe(0);

        # graph.reverse();

        # expect(graph.toString()).toBe('A,B,C,D');
        # expect(graph.getAllEdges().length).toBe(3);
        # expect(graph.getNeighbors(vertexA).length).toBe(0);
        # expect(graph.getNeighbors(vertexB).length).toBe(1);
        # expect(graph.getNeighbors(vertexB)[0].getKey()).toBe(vertexA.getKey());
        # expect(graph.getNeighbors(vertexC).length).toBe(1);
        # expect(graph.getNeighbors(vertexC)[0].getKey()).toBe(vertexA.getKey());
        # expect(graph.getNeighbors(vertexD).length).toBe(1);
        # expect(graph.getNeighbors(vertexD)[0].getKey()).toBe(vertexC.getKey());
    }

    it 'should return vertices indices' {
        # const vertexA = new GraphVertex('A');
        # const vertexB = new GraphVertex('B');
        # const vertexC = new GraphVertex('C');
        # const vertexD = new GraphVertex('D');

        # const edgeAB = new GraphEdge(vertexA, vertexB);
        # const edgeBC = new GraphEdge(vertexB, vertexC);
        # const edgeCD = new GraphEdge(vertexC, vertexD);
        # const edgeBD = new GraphEdge(vertexB, vertexD);

        # const graph = new Graph();
        # graph
        #   .addEdge(edgeAB)
        #   .addEdge(edgeBC)
        #   .addEdge(edgeCD)
        #   .addEdge(edgeBD);

        # const verticesIndices = graph.getVerticesIndices();
        # expect(verticesIndices).toEqual({
        #   A: 0,
        #   B: 1,
        #   C: 2,
        #   D: 3,
        # });
    }

    it 'should generate adjacency matrix for undirected graph' {
        # const vertexA = new GraphVertex('A');
        # const vertexB = new GraphVertex('B');
        # const vertexC = new GraphVertex('C');
        # const vertexD = new GraphVertex('D');

        # const edgeAB = new GraphEdge(vertexA, vertexB);
        # const edgeBC = new GraphEdge(vertexB, vertexC);
        # const edgeCD = new GraphEdge(vertexC, vertexD);
        # const edgeBD = new GraphEdge(vertexB, vertexD);

        # const graph = new Graph();
        # graph
        #   .addEdge(edgeAB)
        #   .addEdge(edgeBC)
        #   .addEdge(edgeCD)
        #   .addEdge(edgeBD);

        # const adjacencyMatrix = graph.getAdjacencyMatrix();
        # expect(adjacencyMatrix).toEqual([
        #   [Infinity, 0, Infinity, Infinity],
        #   [0, Infinity, 0, 0],
        #   [Infinity, 0, Infinity, 0],
        #   [Infinity, 0, 0, Infinity],
        # ]);
    }

    it 'should generate adjacency matrix for directed graph' {
        # $vertexA = new GraphVertex('A');
        # const vertexB = new GraphVertex('B');
        # const vertexC = new GraphVertex('C');
        # const vertexD = new GraphVertex('D');

        # const edgeAB = new GraphEdge(vertexA, vertexB, 2);
        # const edgeBC = new GraphEdge(vertexB, vertexC, 1);
        # const edgeCD = new GraphEdge(vertexC, vertexD, 5);
        # const edgeBD = new GraphEdge(vertexB, vertexD, 7);

        # const graph = new Graph(true);
        # graph
        #   .addEdge(edgeAB)
        #   .addEdge(edgeBC)
        #   .addEdge(edgeCD)
        #   .addEdge(edgeBD);

        # const adjacencyMatrix = graph.getAdjacencyMatrix();
        # expect(adjacencyMatrix).toEqual([
        #   [Infinity, 2, Infinity, Infinity],
        #   [Infinity, Infinity, 1, 7],
        #   [Infinity, Infinity, Infinity, 5],
        #   [Infinity, Infinity, Infinity, Infinity],
        # ]);
    }
}
