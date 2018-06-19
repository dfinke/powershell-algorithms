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
        $this.vertices = @{}
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

    # /**
    #  * Reverse all the edges in directed graph.
    #  * @return {Graph}
    #  */
    # reverse() {
    #   /** @param {GraphEdge} edge */
    #   this.getAllEdges().forEach((edge) => {
    #     # Delete straight edge from graph and from vertices.
    #     this.deleteEdge(edge);

    #     # Reverse the edge.
    #     edge.reverse();

    #     # Add reversed edge back to the graph and its vertices.
    #     this.addEdge(edge);
    #   });

    #   return this;
    # }

    # /**
    #  * @return {object}
    #  */
    # getVerticesIndices() {
    #   const verticesIndices = {};
    #   this.getAllVertices().forEach((vertex, index) => {
    #     verticesIndices[vertex.getKey()] = index;
    #   });

    #   return verticesIndices;
    # }

    # /**
    #  * @return {*[][]}
    #  */
    # getAdjacencyMatrix() {
    #   const vertices = this.getAllVertices();
    #   const verticesIndices = this.getVerticesIndices();

    #   # Init matrix with infinities meaning that there is no ways of
    #   # getting from one vertex to another yet.
    #   const adjacencyMatrix = Array(vertices.length).fill(null).map(() => {
    #     return Array(vertices.length).fill(Infinity);
    #   });

    #   # Fill the columns.
    #   vertices.forEach((vertex, vertexIndex) => {
    #     vertex.getNeighbors().forEach((neighbor) => {
    #       const neighborIndex = verticesIndices[neighbor.getKey()];
    #       adjacencyMatrix[vertexIndex][neighborIndex] = this.findEdge(vertex, neighbor).weight;
    #     });
    #   });

    #   return adjacencyMatrix;
    # }

    [string] toString() {
        return $this.vertices.keys -join ","
    }
}
