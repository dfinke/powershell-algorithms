. $PSScriptRoot\..\linked-list\LinkedList.ps1
. $PSScriptRoot\..\linked-list\LinkedListNode.ps1

class Stack {
    $linkedList

    Stack() {
        $this.linkedList = New-Object LinkedList
    }

    [bool] isEmpty() {
        return !$this.linkedList.tail
    }

    [object] peek() {
        if ($this.isEmpty()) {
            return $null
        }

        return $this.linkedList.tail.value
    }

    push($value) {
        $this.linkedList.append($value)
    }

    [object] pop() {
        $removedTail = $this.linkedList.deleteTail()

        if ($removedTail) {
            return $removedTail.value
        }
        else {
            return $null
        }
        #return removedTail ? removedTail.value : null;
    }

    [object] toArray() {
        [System.Collections.ArrayList]$a = $this.linkedList.toArray().value

        $a.Reverse()
        return $a
        # return (3, 2, 1)
        # return this.linkedList
        #   .toArray()
        #   .map(linkedListNode => linkedListNode.value)
        #   .reverse();
    }

    [object] ToString() {
        return $this.linkedList.toString()
    }

    [object] ToString($callback) {
        return $this.linkedList.toString($callback)
    }
}