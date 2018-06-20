class Graph {
    $vertices
    $edges
    [bool]$isDirected

    Graph () {
        $this.DoInit($false)
    }

    Graph ($isDirected) {
        $this.DoInit($isDirected)
    }

    DoInit($isDirected) {
        $this.vertices = [Ordered]@{}
        $this.edges = [Ordered]@{}
        $this.isDirected = $isDirected
    }

    [object] addVertex($newVertex) {
        $this.vertices[$newVertex.getKey()] = $newVertex
        return $this
    }

    [object] getVertexByKey($vertexKey) {
        return $this.vertices[$vertexKey]
    }

    [object] getNeighbors($vertex) {
        return $vertex.getNeighbors()
    }

    [object[]] getAllVertices() {
        return $this.vertices.values
    }

    [object[]] getAllEdges() {
        return $this.edges.values
    }

    [object] addEdge($edge) {
        # Try to find and end start vertices.
        $startVertex = $this.getVertexByKey($edge.startVertex.getKey())
        $endVertex = $this.getVertexByKey($edge.endVertex.getKey())

        # Insert start vertex if it wasn't inserted.
        if (!$startVertex) {
            $this.addVertex($edge.startVertex)
            $startVertex = $this.getVertexByKey($edge.startVertex.getKey())
        }

        # Insert end vertex if it wasn't inserted.
        if (!$endVertex) {
            $this.addVertex($edge.endVertex)
            $endVertex = $this.getVertexByKey($edge.endVertex.getKey())
        }

        # Check if edge has been already added.
        if ($this.edges[$edge.getKey()]) {
            throw 'Edge has already been added before'
        }
        else {
            $this.edges[$edge.getKey()] = $edge
        }

        # Add edge to the vertices.
        if ($this.isDirected) {
            # If graph IS directed then add the edge only to start vertex.
            $startVertex.addEdge($edge)
        }
        else {
            # If graph ISN'T directed then add the edge to both vertices.
            $startVertex.addEdge($edge)
            $endVertex.addEdge($edge)
        }

        return $this
    }

    deleteEdge($edge) {
        # Delete edge from the list of edges.
        if ($this.edges[$edge.getKey()]) {
            $this.edges.Remove($edge.getKey())
        }
        else {
            throw 'Edge not found in graph'
        }

        # Try to find and end start vertices and delete edge from them.
        $startVertex = $this.getVertexByKey($edge.startVertex.getKey())
        $endVertex = $this.getVertexByKey($edge.endVertex.getKey())

        $startVertex.deleteEdge($edge)
        $endVertex.deleteEdge($edge)
    }

    [object] findEdge($startVertex, $endVertex) {
        $vertex = $this.getVertexByKey($startVertex.getKey())
        return $vertex.findEdge($endVertex)
    }

    [Object] findVertexByKey($vertexKey) {
        if ($this.vertices[$vertexKey]) {
            return $this.vertices[$vertexKey]
        }

        return $null
    }

    [object] getWeight() {
        $weight = 0
        foreach ($graphEdge in $this.getAllEdges()) {
            $weight += $graphEdge.weight
        }

        return $weight
    }

    [object] reverse() {

        foreach ($edge in $this.getAllEdges()) {
            # Delete straight edge from graph and from vertices.
            $this.deleteEdge($edge)

            # Reverse the edge.
            $edge.reverse()

            # Add reversed edge back to the graph and its vertices.
            $this.addEdge($edge)
        }

        return $this
    }

    [System.Collections.Specialized.OrderedDictionary] getVerticesIndices() {
        $verticesIndices = [Ordered]@{}

        $allVertices = $this.getAllVertices()

        for ($idx = 0; $idx -lt $allVertices.Count; $idx += 1) {
            $item = $allVertices[$idx]
            $verticesIndices.($item.getKey()) = $idx
        }

        return $verticesIndices
    }

    [object] getAdjacencyMatrix() {
        $targetVertices = $this.getAllVertices()
        $verticesIndices = $this.getVerticesIndices()

        #   # Init matrix with infinities meaning that there is no ways of
        #   # getting from one vertex to another yet.

        $adjacencyMatrix = (0..($targetVertices.Count)).ForEach{New-Object object[] ($targetVertices.Count)}

        for ($outer = 0; $outer -le $targetVertices.Count; $outer += 1) {
            for ($inner = 0; $inner -le $targetVertices.Count - 1; $inner += 1) {
                $adjacencyMatrix[$outer][$inner] = [double]::PositiveInfinity
            }
        }

        # Fill the columns.
        for ($vertexIndex = 0; $vertexIndex -le $targetVertices.Count - 1; $vertexIndex += 1) {
            $vertex = $targetVertices[$vertexIndex]

            foreach ($neighbor in $vertex.getNeighbors()) {
                $neighborIndex = $verticesIndices[$neighbor.getKey()]
                $adjacencyMatrix[$vertexIndex][$neighborIndex] = $this.findEdge($vertex, $neighbor).weight
            }
        }

        return $adjacencyMatrix
    }

    [string] toString() {
        return $this.vertices.keys -join ","
    }
}
