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

    [object] getKey() {
        $startVertexKey = $this.startVertex.getKey()
        $endVertexKey = $this.endVertex.getKey()

        return "$($startVertexKey)_$($endVertexKey)"
        # return `${startVertexKey}_${endVertexKey}`;
    }

    [object] reverse() {
        $tmp = $this.startVertex
        $this.startVertex = $this.endVertex
        $this.endVertex = $tmp

        return $this
    }


    [string] toString() {
        return $this.getKey()
    }
}