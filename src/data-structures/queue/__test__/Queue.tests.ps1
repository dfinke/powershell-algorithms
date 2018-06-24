. $PSScriptRoot\..\Queue.ps1

describe 'Queue' {
    it 'should create empty queue' {
        $queue = New-Object Queue

        $queue | Should Not BeNullOrEmpty
        $queue.linkedList.head | Should BeNullOrEmpty
        $queue.linkedList.tail | Should BeNullOrEmpty
    }

    it 'should enqueue data to queue' {
        $queue = New-Object Queue

        $queue.enqueue(1)
        $queue.enqueue(2)

        $queue.toString() | Should Be '1,2'
    }

    it 'should be possible to enqueue/dequeue objects' {
        $queue = New-Object Queue

        $queue.enqueue(@{ value = 'test1'; key = 'key1' })
        $queue.enqueue(@{ value = 'test2'; key = 'key2' })

        $queue.dequeue().value | Should Be 'test1'
        $queue.dequeue().value | Should Be 'test2'
    }

    it 'should peek data from queue' {
        $queue = New-Object Queue

        $queue.peek() | Should Be $null

        $queue.enqueue(1)
        $queue.enqueue(2)

        $queue.peek() | Should Be 1
        $queue.peek() | Should Be 1
    }

    it 'should check if queue is empty' {
        $queue = New-Object Queue

        $queue.isEmpty() | Should Be $true

        $queue.enqueue(1)

        $queue.isEmpty() | Should Be $false
    }

    it 'should dequeue from queue in FIFO order' {
        $queue = New-Object Queue

        $queue.enqueue(1)
        $queue.enqueue(2)

        $queue.dequeue() | Should Be 1
        $queue.dequeue() | Should Be 2
        $queue.dequeue() | Should Be $null
        $queue.isEmpty() | Should Be $true
    }
}
