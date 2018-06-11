. $PSScriptRoot\..\Stack.ps1

describe 'Stack' {
    it 'should create empty stack' {
        $stack = New-Object Stack
        $stack | Should Not BeNullOrEmpty
        $stack.linkedList | Should BeNullOrEmpty
        $stack.linkedList.head | Should BeNullOrEmpty
        $stack.linkedList.tail | Should BeNullOrEmpty
    }

    it 'should stack data to stack' {
        $stack = New-Object Stack

        $stack.push(1);
        $stack.push(2);

        $stack.toString() | Should Be '1,2'
    }

    it 'should peek data from stack' {
        $stack = New-Object Stack
        $stack.peek() | should be $null

        $stack.push(1)
        $stack.push(2)

        $stack.peek() | should be 2
        $stack.peek() | should be 2
    }

    it 'should check if stack is empty' {
        $stack = New-Object Stack

        $stack.isEmpty() | should be $true
        $stack.push(1)
        $stack.isEmpty() | should be $false
    }

    it 'should pop data from stack' {
        $stack = New-Object Stack

        $stack.push(1);
        $stack.push(2);

        $stack.pop() | Should Be 2
        $stack.pop() | Should Be 1
        $stack.pop() | Should Be $null
        $stack.isEmpty() | Should Be $true
    }

    it 'should be possible to push/pop objects' {
        $stack = New-Object Stack

        $stack.push(@{ value = 'test1'; key = 'key1' })
        $stack.push(@{ value = 'test2'; key = 'key2' })

        # const stringifier = value => `${value.key}:${value.value}`;
        #$stack.toString() | Should Be 'a'

        $stack.pop().value | should Be 'test2'
        $stack.pop().value | should Be 'test1'
    }

    it 'should be possible to convert stack to array' {
        $stack = New-Object Stack

        $stack.peek() | should be $null

        $stack.push(1)
        $stack.push(2)
        $stack.push(3)

        $stack.toArray() | should be (3, 2, 1)
    }
}