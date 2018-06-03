Import-Module $PSScriptRoot\..\LinkedList.psd1 -Force

Describe "LinkedListNode" {
    BeforeEach {
        $node1 = New-Object LinkedListNode 1
        $node2 = New-Object LinkedListNode 1, @{a = 1}
    }

    It "node1 should have a value of 1" {
        $node1.value | should be 1
    }

    It "node1 next should be null" {
        $node1.next | should BeNullOrEmpty
    }

    It "node2 should have a value of 1" {
        $node1.value | should be 1
    }

    It "node2 next should be a Hashtable" {
        $node2.next.GetType().Name | should be "Hashtable"
    }

    It "node2 next should have these keys and values" {
        $node2.next.ContainsKey('a') | should be $true
        $node2.next.a | should be 1
    }
}