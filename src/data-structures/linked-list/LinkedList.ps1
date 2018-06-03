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
        return $this.Find($value, $null)
    }

    [object] Find([scriptblock]$callback) {
        return $this.Find($null, $callback)
    }

    hidden [object] Find($value, [scriptblock]$callback) {
        if (!$this.head) {
            return $null
        }

        $currentNode = $this.head

        while ($currentNode) {

            if ($callback -and (&$callback $currentNode.value)) {
                return $currentNode
            }

            if ($currentNode.value -eq $value) {
                return $currentNode
            }

            $currentNode = $currentNode.next
        }

        return $null
    }

    [object] deleteHead() {
        if (!$this.head) {
            return $null
        }

        $deletedHead = $this.head

        if ($this.head.next) {
            $this.head = $this.head.next
        }
        else {
            $this.head = $null
            $this.tail = $null
        }

        return $deletedHead;
    }

    [object] deleteTail() {
        if ($this.head -eq $this.tail) {
            $deletedTail = $this.tail
            $this.head = $null
            $this.tail = $null

            return $deletedTail
        }

        $deletedTail = $this.tail

        # Rewind to the last node and delete "next" link for the node before the last one.
        $currentNode = $this.head
        while ($currentNode.next) {
            if (!$currentNode.next.next) {
                $currentNode.next = $null
            }
            else {
                $currentNode = $currentNode.next
            }
        }

        $this.tail = $currentNode
        return $deletedTail
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
