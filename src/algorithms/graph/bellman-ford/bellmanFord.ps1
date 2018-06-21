function bellmanFord($graph, $startVertex) {
    $distances = @{}
    $previousVertices = @{}

    # Init all distances with infinity assuming that currently we can't reach
    # any of the vertices except start one.
    $distances[$startVertex.getKey()] = 0
    foreach ($vertex in $graph.getAllVertices()) {
        $previousVertices[$vertex.getKey()] = $null
        if ($vertex.getKey() -ne $startVertex.getKey()) {
            $distances[$vertex.getKey()] = [double]::PositiveInfinity
        }
    }

    # We need (|V| - 1) iterations.
    for ($iteration = 0; $iteration -lt ($graph.getAllVertices().count - 1); $iteration += 1) {

        # During each iteration go through all vertices.
        $distancesKeys = $distances.Keys.Clone()
        foreach ($vertexKey in $distancesKeys) {
            $vertex = $graph.getVertexByKey($vertexKey)

            # Go through all vertex edges.
            foreach ($neighbor in $graph.getNeighbors($vertex)) {
                $edge = $graph.findEdge($vertex, $neighbor)

                # Find out if the distance to the neighbor is shorter in this iteration
                # then in previous one.
                $distanceToVertex = $distances[$vertex.getKey()]
                $distanceToNeighbor = $distanceToVertex + $edge.weight
                if ($distanceToNeighbor -lt $distances[$neighbor.getKey()]) {
                    $distances[$neighbor.getKey()] = $distanceToNeighbor
                    $previousVertices[$neighbor.getKey()] = $vertex
                }
            }
        }
    }

    $distances, $previousVertices
}
