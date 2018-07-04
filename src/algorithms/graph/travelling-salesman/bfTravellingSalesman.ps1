function findAllPaths($startVertex, $paths = @(), $path = @()) {
    # Clone path.
    $currentPath = $path.clone()

    # Add startVertex to the path.
    $currentPath += $startVertex

    # Generate visited set from path.

    $visitedSet = currentPath.reduce((accumulator, vertex) = > {
            #     const updatedAccumulator = { ...accumulator };
            #     updatedAccumulator[vertex.getKey()] = vertex;

            #     return updatedAccumulator;
            #   }, {});

            $visitedSet = @{}
            foreach ($vertex in $currentPath) {
                $visitedSet[($vertex.getKey())] = $vertex
            }

            # Get all unvisited neighbors of startVertex.

            $unvisitedNeighbors = startVertex.getNeighbors().filter((neighbor) => {
                    #     return !visitedSet[neighbor.getKey()];
                    #   });

                    $unvisitedNeighbors = $startVertex.getNeighbors().Where{
                        !$visitedSet[$_.getKey()]
                    }
                    # If there no unvisited neighbors then treat current path as complete and save it.
                    if (!$unvisitedNeighbors.count) {
                        $paths += $currentPath
                        return $paths
                    }

                    # Go through all the neighbors.
                    for ($neighborIndex = 0; $neighborIndex -lt $unvisitedNeighbors.count; $neighborIndex += 1) {
                        $currentUnvisitedNeighbor = $unvisitedNeighbors[$neighborIndex]
                        findAllPaths $currentUnvisitedNeighbor $paths $currentPath
                    }

                    return $paths
                }

                function getCycleWeight($adjacencyMatrix, $verticesIndices, $cycle) {
                    $weight = 0;

                    #   for (let cycleIndex = 1; cycleIndex < cycle.length; cycleIndex += 1) {
                    #     const fromVertex = cycle[cycleIndex - 1];
                    #     const toVertex = cycle[cycleIndex];
                    #     const fromVertexIndex = verticesIndices[fromVertex.getKey()];
                    #     const toVertexIndex = verticesIndices[toVertex.getKey()];
                    #     weight += adjacencyMatrix[fromVertexIndex][toVertexIndex];
                    #   }

                    #   return weight;
                }

                function bfTravellingSalesman($graph) {
                    # Pick starting point from where we will traverse the graph.
                    $startVertex = $graph.getAllVertices()[0]

                    # BRUTE FORCE.
                    # Generate all possible paths from startVertex.
                    $allPossiblePaths = findAllPaths $startVertex

                    # Filter out paths that are not cycles.
                    $allPossibleCycles = allPossiblePaths.filter((path) = > {
                            #     /** @var {GraphVertex} */
                            #     const lastVertex = path[path.length - 1];
                            #     const lastVertexNeighbors = lastVertex.getNeighbors();

                            #     return lastVertexNeighbors.includes(startVertex);
                            #   });

                            $allPossiblePaths.ForEach{
                                $lastVertex = $_[($_.Count - 1)]
                                $lastVertexNeighbors = $lastVertex.getNeighbors()
                                $idx = 0
                                #$lastVertexNeighbors.includes($startVertex)
                            }

                            # Go through all possible cycles and pick the one with minimum overall tour weight.
                            $adjacencyMatrix = $graph.getAdjacencyMatrix()
                            $verticesIndices = $graph.getVerticesIndices()
                            $salesmanPath = @()
                            $salesmanPathWeight = $null
                            #   for (let cycleIndex = 0; cycleIndex < allPossibleCycles.length; cycleIndex += 1) {
                            #     const currentCycle = allPossibleCycles[cycleIndex];
                            #     const currentCycleWeight = getCycleWeight(adjacencyMatrix, verticesIndices, currentCycle);

                            # If current cycle weight is smaller then previous ones treat current cycle as most optimal.
                            #     if (salesmanPathWeight === null || currentCycleWeight < salesmanPathWeight) {
                            #       salesmanPath = currentCycle;
                            #       salesmanPathWeight = currentCycleWeight;
                            #     }
                            #   }

                            # Return the solution.
                            #   return salesmanPath;
                            4
                        }
