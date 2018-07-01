. $PSScriptRoot\..\..\..\data-structures\queue\Queue.ps1

function enterVertex {}
function leaveVertex {}

function allowTraversal {
    $seen = @{}

    if (!$seen[$nextVertex.getKey()]) {
        $seen[$nextVertex.getKey()] = $true
        return $true
    }

    return $false
}

function breadthFirstSearch($graph, $startVertex) {
    $vertexQueue = New-Object Queue

    # Do initial queue setup.
    $vertexQueue.enqueue($startVertex)
    $previousVertex = $null

    # Traverse all vertices from the queue.
    while (!$vertexQueue.isEmpty()) {
        $currentVertex = $vertexQueue.dequeue()

        enterVertex $currentVertex $previousVertex

        # Add all neighbors to the queue for future traversals.
        $graph.getNeighbors($currentVertex).ForEach{
            $nextVertex = $_
            if (allowTraversal) {
                $vertexQueue.enqueue($nextVertex)
            }
        }

        leaveVertex $currentVertex $previousVertex

        # Memorize current vertex before next loop.
        $previousVertex = $currentVertex
    }
}
