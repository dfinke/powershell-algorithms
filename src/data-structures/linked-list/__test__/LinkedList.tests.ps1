Import-Module $PSScriptRoot\..\LinkedList.psd1 -Force

Describe "LinkedList" {

    it 'should append node to linked list' {
        $linkedList = New-Object LinkedList

        $linkedList.head | Should  BeNullOrEmpty
        $linkedList.tail | Should  BeNullOrEmpty
        $linkedList.append(1)
        $linkedList.append(2)

        $linkedList.ToString() | should be "1,2"
    }

    it 'should prepend node to linked list' {
        $linkedList = New-Object LinkedList

        $linkedList.Append(1)
        $linkedList.Prepend(2)

        $linkedList.ToString() | should be '2,1'
    }

    it 'should find node by value' {
        $linkedList = New-Object LinkedList

        $linkedList.Find(5) | Should BeNullOrEmpty

        $linkedList.Append(1)

        $linkedList.Find(5).value | Should BeNullOrEmpty
        $linkedList.Find(1).value | Should Be 1

        $linkedList.Append(2)
        $linkedList.Append(3)

        $node = $linkedList.Find(2)

        $node.value | Should Be 2

        $linkedList.Find(5).value | Should BeNullOrEmpty
    }

    it 'should find node by callback' {
        $linkedList = New-Object LinkedList

        $linkedList.append( @{ value = 1; key = 'test1' })
        $linkedList.append( @{ value = 2; key = 'test2' })
        $linkedList.append( @{ value = 3; key = 'test3' });

        $node = $linkedList.find( {
                param($currentNode)

                $currentNode.key -eq 'test2'
            })

        $node.value.key   | Should Be 'test2'
        $node.value.value | Should Be 2

        $linkedList.find( {$args[0].key -eq 'test5'} ) | Should BeNullOrEmpty
    }

    it 'should delete linked list head' {
        $linkedList = New-Object LinkedList

        $linkedList.deleteHead() | Should Be $null

        $linkedList.append(1)
        $linkedList.append(2)

        $linkedList.head.toString() | Should Be 1
        $linkedList.tail.toString() | Should Be 2

        $deletedNode1 = $linkedList.deleteHead()

        $deletedNode1.value | Should Be 1
        $linkedList.toString() | Should Be 2
        $linkedList.head.toString() | Should Be 2
        $linkedList.tail.toString() | Should Be 2

        $deletedNode2 = $linkedList.deleteHead()

        $deletedNode2.value | Should Be 2
        $linkedList.toString() | Should BeNullOrEmpty

        $linkedList.head | Should BeNullOrEmpty
        $linkedList.tail | Should BeNullOrEmpty
    }
}