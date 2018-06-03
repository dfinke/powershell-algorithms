. $PSScriptRoot\LinkedListNode.ps1

class LinkedList {
    $head
    $tail

    [object] Append($value) {
        $newNode = New-Object LinkedListNode $value

        # If there is no head yet let's make new node a head.
        if (!$this.head) {
            $this.head = $newNode
            $this.tail = $newNode
            return $this
        }

        # Attach new node to the end of linked list.
        $this.tail.next = $newNode
        $this.tail = $newNode

        return $this
    }

    [object] Prepend($value) {
        #  Make new node to be a head.
        $this.head = New-Object LinkedListNode $value, $this.head
        return $this
    }

    [object] Find($value) {
        if (!$this.head) {
            return $null
        }

        $currentNode = $this.head

        while ($currentNode) {

            if ($currentNode.value -eq $value) {
                return $currentNode
            }

            $currentNode = $currentNode.next
        }

        return $null
    }

    [object] Find([scriptblock]$callback) {
        return $null
    }

    [object] ToArray() {
        $nodes = @()
        $currentNode = $this.head
        while ($currentNode) {
            $nodes += ($currentNode)
            $currentNode = $currentNode.next
        }

        return $nodes
    }

    [string]ToString() {
        return ($this.ToArray() -join ",")
    }
}
