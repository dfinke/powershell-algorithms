. $PSScriptRoot\..\linked-list\LinkedList.ps1

class Queue {
    $linkedList

    Queue() {
        $this.linkedList = New-Object LinkedList
    }

    # isEmpty() {
    #     return !this.linkedList.tail;
    # }

    # peek() {
    #     if (!this.linkedList.head) {
    #         return null;
    #     }

    #     return this.linkedList.head.value;
    # }

    enqueue($value) {
        $this.linkedList.append($value)
    }

    # dequeue() {
    #     const removedHead = this.linkedList.deleteHead();
    #     return removedHead ? removedHead.value : null;
    # }


    [string] toString() {
        return $this.toString($null)
    }

    [string] toString($callback) {
        return $this.linkedList.toString($callback)
    }
}
