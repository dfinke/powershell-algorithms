. $PSScriptRoot\..\..\..\data-structures\queue\Queue.ps1

function initCallbacks($callbacks = @{}) {
    #   const initiatedCallback = callbacks;

    #   const stubCallback = () => {};

    #   const allowTraversalCallback = (
    #     () => {
    #       const seen = {};
    #       return ({ nextVertex }) => {
    #         if (!seen[nextVertex.getKey()]) {
    #           seen[nextVertex.getKey()] = true;
    #           return true;
    #         }
    #         return false;
    #       };
    #     }
    #   )();

    #   initiatedCallback.allowTraversal = callbacks.allowTraversal || allowTraversalCallback;
    #   initiatedCallback.enterVertex = callbacks.enterVertex || stubCallback;
    #   initiatedCallback.leaveVertex = callbacks.leaveVertex || stubCallback;

    #   return initiatedCallback;
}

function breadthFirstSearch($graph, $startVertex, $originalCallbacks) {
    #   const callbacks = initCallbacks(originalCallbacks);
    #   const vertexQueue = new Queue();

    #   // Do initial queue setup.
    #   vertexQueue.enqueue(startVertex);

    #   let previousVertex = null;

    #   // Traverse all vertices from the queue.
    #   while (!vertexQueue.isEmpty()) {
    #     const currentVertex = vertexQueue.dequeue();
    #     callbacks.enterVertex({ currentVertex, previousVertex });

    #     // Add all neighbors to the queue for future traversals.
    #     graph.getNeighbors(currentVertex).forEach((nextVertex) => {
    #       if (callbacks.allowTraversal({ previousVertex, currentVertex, nextVertex })) {
    #         vertexQueue.enqueue(nextVertex);
    #       }
    #     });

    #     callbacks.leaveVertex({ currentVertex, previousVertex });

    #     // Memorize current vertex before next loop.
    #     previousVertex = currentVertex;
    #   }
}
