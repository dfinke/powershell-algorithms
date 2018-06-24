. $PSScriptRoot\..\linked-list\LinkedList.ps1

class Queue {
    $linkedList

    Queue() {
        $this.linkedList = New-Object LinkedList
    }

    [bool] isEmpty() {
        return !$this.linkedList.tail
    }

    [object] peek() {
        if (!$this.linkedList.head) {
            return $null
        }

        return $this.linkedList.head.value
    }

    enqueue($value) {
        $this.linkedList.append($value)
    }

    [object] dequeue() {
        $removedHead = $this.linkedList.deleteHead()

        if($removedHead) {
            return $removedHead.value
        }

        return $null
    }

    [string] toString() {
        return $this.toString($null)
    }

    [string] toString($callback) {
        return $this.linkedList.toString($callback)
    }
}