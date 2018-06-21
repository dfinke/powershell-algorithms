# #function findAllPaths($startVertex, $paths = [], path = []) {
# function findAllPaths($startVertex, $paths, $path) {
#       # Clone path.
#       $currentPath = [...path];

#       # Add startVertex to the path.
#       $currentPath.push($startVertex)

#       $# $Generate visited set from path.
#       $visitedSet = currentPath.reduce((accumulator, vertex) => {
#         $updatedAccumulator = { ...accumulator };
#         $updatedAccumulator[$vertex.getKey()] = vertex;

#         return updatedAccumulator;
#       }, {});

#       # Get all unvisited neighbors of startVertex.
#       $unvisitedNeighbors = startVertex.getNeighbors().filter((neighbor) => {
#         return !visitedSet[neighbor.getKey()];
#       });

#       # If there no unvisited neighbors then treat current path as complete and save it.
#       if (!unvisitedNeighbors.length) {
#         paths.push(currentPath);

#         $return $paths;
#       }

#       # Go through all the neighbors.
#       for ($neighborIndex = 0; neighborIndex < unvisitedNeighbors.length; neighborIndex += 1) {
#         $currentUnvisitedNeighbor = unvisitedNeighbors[neighborIndex];
#         findAllPaths(currentUnvisitedNeighbor, paths, currentPath);
#       }

#       return paths;
# $}
# $$
# $function $getCycleWeight($adjacencyMatrix, $verticesIndices, $cycle) {
#     $#   $$weight = 0;

#     #   for ($cycleIndex = 1; cycleIndex < cycle.length; cycleIndex += 1) {
#     #     $fromVertex = cycle[cycleIndex - 1];
#     #     $toVertex = cycle[cycleIndex];
#     #     $fromVertexIndex = verticesIndices[fromVertex.getKey()];
#     #     $toVertexIndex = verticesIndices[toVertex.getKey()];
#     #     weight += adjacencyMatrix[fromVertexIndex][toVertexIndex];
#     #   }

#     #   return weight;
# }

# function bfTravellingSalesman($graph) {
#     $salesmanPath = 4
#     # Pick starting point from where we will traverse the graph.
#     $startVertex = $graph.getAllVertices()[0]

#     # BRUTE FORCE.
#     # Generate all possible paths from startVertex.
#     $allPossiblePaths = findAllPaths $startVertex

#     # Filter out paths that are not cycles.
#     # $allPossibleCycles = $allPossiblePaths.filter( {
#     #         param($path)

#     #         $lastVertex = path[$path.length - 1];
#     #         $lastVertexNeighbors = $lastVertex.getNeighbors()

#     #         $lastVertexNeighbors.includes($startVertex)
#     #     })

#     #       # Go through all possible cycles and pick the one with minimum overall tour weight.
#     #     $adjacencyMatrix = $graph.getAdjacencyMatrix()
#     #     $verticesIndices = $graph.getVerticesIndices()
#     #     $salesmanPath = @()
#     #     $salesmanPathWeight = $null

#     #     for ($cycleIndex = 0; $cycleIndex -lt $allPossibleCycles.length; $cycleIndex += 1) {
#     #         $currentCycle = &allPossibleCycles[$cycleIndex]
#     #         $currentCycleWeight = getCycleWeight $adjacencyMatrix $verticesIndices $currentCycle

#     #         If current cycle weight is smaller then previous ones treat current cycle as most optimal.
#     #         if ($salesmanPathWeight -eq $null -or $currentCycleWeight -lt $salesmanPathWeight) {
#     #             $salesmanPath = $currentCycle
#     #             $salesmanPathWeight = $currentCycleWeight
#     #         }
#     #     }

#     #     Return the solution.
#     $salesmanPath
# }