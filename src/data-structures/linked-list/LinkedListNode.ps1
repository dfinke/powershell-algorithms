# https://github.com/trekhleb/javascript-algorithms/tree/master/src/data-structures/linked-list

class LinkedListNode {
    $value
    $next

    LinkedListNode($value) {
        $this.value = $value
    }

    LinkedListNode($value, $next) {
        $this.value = $value
        $this.next = $next
    }

    [string]ToString() {
        return $this.value
    }
}