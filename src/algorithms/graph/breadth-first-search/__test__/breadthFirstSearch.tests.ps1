. $PSScriptRoot\..\..\..\..\data-structures\graph\Graph.ps1
. $PSScriptRoot\..\..\..\..\data-structures\graph\GraphVertex.ps1
. $PSScriptRoot\..\..\..\..\data-structures\graph\GraphEdge.ps1
. $PSScriptRoot\..\breadthFirstSearch.ps1

describe 'breadthFirstSearch' {
    it 'should perform BFS operation on graph' {
        $graph = New-Object Graph true

        $vertexA = New-Object GraphVertex 'A'
        $vertexB = New-Object GraphVertex 'B'
        $vertexC = New-Object GraphVertex 'C'
        $vertexD = New-Object GraphVertex 'D'
        $vertexE = New-Object GraphVertex 'E'
        $vertexF = New-Object GraphVertex 'F'
        $vertexG = New-Object GraphVertex 'G'
        $vertexH = New-Object GraphVertex 'H'

        $edgeAB = New-Object GraphEdge $vertexA, $vertexB
        $edgeBC = New-Object GraphEdge $vertexB, $vertexC
        $edgeCG = New-Object GraphEdge $vertexC, $vertexG
        $edgeAD = New-Object GraphEdge $vertexA, $vertexD
        $edgeAE = New-Object GraphEdge $vertexA, $vertexE
        $edgeEF = New-Object GraphEdge $vertexE, $vertexF
        $edgeFD = New-Object GraphEdge $vertexF, $vertexD
        $edgeDH = New-Object GraphEdge $vertexD, $vertexH
        $edgeGH = New-Object GraphEdge $vertexG, $vertexH

        $graph.
          addEdge($edgeAB).
          addEdge($edgeBC).
          addEdge($edgeCG).
          addEdge($edgeAD).
          addEdge($edgeAE).
          addEdge($edgeEF).
          addEdge($edgeFD).
          addEdge($edgeDH).
          addEdge($edgeGH)

        $graph.toString() | Should Be 'A,B,C,G,D,E,F,H'

        # $enterVertexCallback = jest.fn();
        # $leaveVertexCallback = jest.fn();

        # Traverse graphs without callbacks first.
        breadthFirstSearch $graph $vertexA

        # # Traverse graph with enterVertex and leaveVertex callbacks.
        # breadthFirstSearch(graph, vertexA, {
        #   enterVertex: enterVertexCallback,
        #   leaveVertex: leaveVertexCallback,
        # });

        # expect(enterVertexCallback).toHaveBeenCalledTimes(8);
        # expect(leaveVertexCallback).toHaveBeenCalledTimes(8);

        # const enterVertexParamsMap = [
        #   { currentVertex: vertexA, previousVertex: null },
        #   { currentVertex: vertexB, previousVertex: vertexA },
        #   { currentVertex: vertexD, previousVertex: vertexB },
        #   { currentVertex: vertexE, previousVertex: vertexD },
        #   { currentVertex: vertexC, previousVertex: vertexE },
        #   { currentVertex: vertexH, previousVertex: vertexC },
        #   { currentVertex: vertexF, previousVertex: vertexH },
        #   { currentVertex: vertexG, previousVertex: vertexF },
        # ];

        # for (let callIndex = 0; callIndex < graph.getAllVertices().length; callIndex += 1) {
        #   const params = enterVertexCallback.mock.calls[callIndex][0];
        #   expect(params.currentVertex).toEqual(enterVertexParamsMap[callIndex].currentVertex);
        #   expect(params.previousVertex).toEqual(enterVertexParamsMap[callIndex].previousVertex);
        # }

        # const leaveVertexParamsMap = [
        #   { currentVertex: vertexA, previousVertex: null },
        #   { currentVertex: vertexB, previousVertex: vertexA },
        #   { currentVertex: vertexD, previousVertex: vertexB },
        #   { currentVertex: vertexE, previousVertex: vertexD },
        #   { currentVertex: vertexC, previousVertex: vertexE },
        #   { currentVertex: vertexH, previousVertex: vertexC },
        #   { currentVertex: vertexF, previousVertex: vertexH },
        #   { currentVertex: vertexG, previousVertex: vertexF },
        # ];

        # for (let callIndex = 0; callIndex < graph.getAllVertices().length; callIndex += 1) {
        #   const params = leaveVertexCallback.mock.calls[callIndex][0];
        #   expect(params.currentVertex).toEqual(leaveVertexParamsMap[callIndex].currentVertex);
        #   expect(params.previousVertex).toEqual(leaveVertexParamsMap[callIndex].previousVertex);
        # }
    }

    it 'should allow to create custom vertex visiting logic' {
        # const graph = new Graph(true);

        # const vertexA = new GraphVertex('A');
        # const vertexB = new GraphVertex('B');
        # const vertexC = new GraphVertex('C');
        # const vertexD = new GraphVertex('D');
        # const vertexE = new GraphVertex('E');
        # const vertexF = new GraphVertex('F');
        # const vertexG = new GraphVertex('G');
        # const vertexH = new GraphVertex('H');

        # const edgeAB = new GraphEdge(vertexA, vertexB);
        # const edgeBC = new GraphEdge(vertexB, vertexC);
        # const edgeCG = new GraphEdge(vertexC, vertexG);
        # const edgeAD = new GraphEdge(vertexA, vertexD);
        # const edgeAE = new GraphEdge(vertexA, vertexE);
        # const edgeEF = new GraphEdge(vertexE, vertexF);
        # const edgeFD = new GraphEdge(vertexF, vertexD);
        # const edgeDH = new GraphEdge(vertexD, vertexH);
        # const edgeGH = new GraphEdge(vertexG, vertexH);

        # graph
        #   .addEdge(edgeAB)
        #   .addEdge(edgeBC)
        #   .addEdge(edgeCG)
        #   .addEdge(edgeAD)
        #   .addEdge(edgeAE)
        #   .addEdge(edgeEF)
        #   .addEdge(edgeFD)
        #   .addEdge(edgeDH)
        #   .addEdge(edgeGH);

        # expect(graph.toString()).toBe('A,B,C,G,D,E,F,H');

        # const enterVertexCallback = jest.fn();
        # const leaveVertexCallback = jest.fn();

        # # Traverse graph with enterVertex and leaveVertex callbacks.
        # breadthFirstSearch(graph, vertexA, {
        #   enterVertex: enterVertexCallback,
        #   leaveVertex: leaveVertexCallback,
        #   allowTraversal: ({ currentVertex, nextVertex }) => {
        #     return !(currentVertex === vertexA && nextVertex === vertexB);
        #   },
        # });

        # expect(enterVertexCallback).toHaveBeenCalledTimes(7);
        # expect(leaveVertexCallback).toHaveBeenCalledTimes(7);

        # const enterVertexParamsMap = [
        #   { currentVertex: vertexA, previousVertex: null },
        #   { currentVertex: vertexD, previousVertex: vertexA },
        #   { currentVertex: vertexE, previousVertex: vertexD },
        #   { currentVertex: vertexH, previousVertex: vertexE },
        #   { currentVertex: vertexF, previousVertex: vertexH },
        #   { currentVertex: vertexD, previousVertex: vertexF },
        #   { currentVertex: vertexH, previousVertex: vertexD },
        # ];

        # for (let callIndex = 0; callIndex < 7; callIndex += 1) {
        #   const params = enterVertexCallback.mock.calls[callIndex][0];
        #   expect(params.currentVertex).toEqual(enterVertexParamsMap[callIndex].currentVertex);
        #   expect(params.previousVertex).toEqual(enterVertexParamsMap[callIndex].previousVertex);
        # }

        # const leaveVertexParamsMap = [
        #   { currentVertex: vertexA, previousVertex: null },
        #   { currentVertex: vertexD, previousVertex: vertexA },
        #   { currentVertex: vertexE, previousVertex: vertexD },
        #   { currentVertex: vertexH, previousVertex: vertexE },
        #   { currentVertex: vertexF, previousVertex: vertexH },
        #   { currentVertex: vertexD, previousVertex: vertexF },
        #   { currentVertex: vertexH, previousVertex: vertexD },
        # ];

        # for (let callIndex = 0; callIndex < 7; callIndex += 1) {
        #   const params = leaveVertexCallback.mock.calls[callIndex][0];
        #   expect(params.currentVertex).toEqual(leaveVertexParamsMap[callIndex].currentVertex);
        #   expect(params.previousVertex).toEqual(leaveVertexParamsMap[callIndex].previousVertex);
        # }
    }
}
