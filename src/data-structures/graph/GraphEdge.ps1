class GraphEdge {

    $startVertex
    $endVertex
    $weight

    GraphEdge($startVertex, $endVertex) {
        $this.DoInit($startVertex, $endVertex, 0)
    }

    GraphEdge($startVertex, $endVertex, $weight) {
        $this.DoInit($startVertex, $endVertex, $weight)
    }

    hidden DoInit($startVertex, $endVertex, $weight) {
        $this.startVertex = $startVertex
        $this.endVertex = $endVertex
        $this.weight = $weight
    }

    # /**
    #  * @return {string}
    #  */
    # getKey() {
    #   const startVertexKey = this.startVertex.getKey();
    #   const endVertexKey = this.endVertex.getKey();

    #   return `${startVertexKey}_${endVertexKey}`;
    # }

    # /**
    #  * @return {GraphEdge}
    #  */
    # reverse() {
    #   const tmp = this.startVertex;
    #   this.startVertex = this.endVertex;
    #   this.endVertex = tmp;

    #   return this;
    # }

    # /**
    #  * @return {string}
    #  */
    # toString() {
    #   return this.getKey();
    # }
}