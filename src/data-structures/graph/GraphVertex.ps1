. $PSScriptRoot\..\linked-list\LinkedList.ps1

class GraphVertex {
    $value
    $edges

    GraphVertex() {
        $this.DoInit($null)
    }

    GraphVertex($value) {
        $this.DoInit($value)
    }

    hidden DoInit($value) {
        if ($value -eq $null) {
            throw 'Graph vertex must have a value'
        }

        $edgeComparator = {
            param($edgeA, $edgeB)

            if ($edgeA.getKey() -eq $edgeB.getKey()) {
                return 0
            }

            if ($edgeA.getKey() -lt $edgeB.getKey()) { return -1 }

            return 1
        }

        # Normally you would store string value like vertex name.
        # But generally it may be any object as well
        $this.value = $value
        $this.edges = New-Object LinkedList $edgeComparator
    }

    [object] addEdge($edge) {
        $this.edges.append($edge)

        return $this
    }

    deleteEdge($edge) {
        $this.edges.delete($edge)
    }

    [object] getNeighbors() {
        $targetEdges = $this.edges.toArray()

        $neighborsConverter = {
            param($node)

            if ($node.value.startVertex -eq $this) {
                return $node.value.endVertex
            }

            return $node.value.startVertex
        }

        # Return either start or end vertex.
        # For undirected graphs it is possible that current vertex will be the end one.
        return @($targetEdges.ForEach{&$neighborsConverter $_})
    }

    [object] getEdges() {
        return $this.edges.toArray().value
    }


    [object] getDegree() {
        return $this.edges.toArray().Count
    }

    [bool] hasEdge($requiredEdge) {
        $edgeNode = $this.edges.find($null, {
                param($edge)
                $edge -eq $requiredEdge
            })

        return !!$edgeNode
    }

    [object] hasNeighbor($vertex) {
        $vertexNode = $this.edges.find($null, {
                param($edge)

                $edge.startVertex -eq $vertex -or $edge.endVertex -eq $vertex
            })

        return !!$vertexNode
    }

    [object] findEdge($vertex) {
      $edgeFinder ={
          param($edge)

          return $edge.startVertex -eq $vertex -Or $edge.endVertex -eq $vertex
      };

      $targetEdge = $this.edges.find($null, $edgeFinder)

      if($targetEdge) {
        return $targetEdge.value
      }

      return $null
      #return edge ? edge.value : null;
    }

    [object] getKey() {
        return $this.value
    }

    [object] deleteAllEdges() {

        foreach ($edge in $this.getEdges()) {
            $this.deleteEdge($edge)
        }

        return $this
    }

    [string] toString() {
        return $this.toString($null)
    }

    [string] toString($callback) {
        #return $null
        # return callback ? callback(this.value) : `$ {this.value}`;

        if ($callback) {
            return &$callback($this.value)
        }

        return $this.value -join '_'
    }
}