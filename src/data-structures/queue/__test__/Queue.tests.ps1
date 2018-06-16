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

        # queue.enqueue({ value: 'test1', key: 'key1' });
        # queue.enqueue({ value: 'test2', key: 'key2' });

        # const stringifier = value => `${value.key}:${value.value}`;

        # expect(queue.toString(stringifier)).toBe('key1:test1,key2:test2');
        # expect(queue.dequeue().value).toBe('test1');
        # expect(queue.dequeue().value).toBe('test2');
    }

    it 'should peek data from queue' {
        $queue = New-Object Queue

        # expect(queue.peek()).toBeNull();

        # queue.enqueue(1);
        # queue.enqueue(2);

        # expect(queue.peek()).toBe(1);
        # expect(queue.peek()).toBe(1);
    }

    it 'should check if queue is empty' {
        $queue = New-Object Queue

        # expect(queue.isEmpty()).toBeTruthy();

        # queue.enqueue(1);

        # expect(queue.isEmpty()).toBeFalsy();
    }

    it 'should dequeue from queue in FIFO order' {
        $queue = New-Object Queue

        # queue.enqueue(1);
        # queue.enqueue(2);

        # expect(queue.dequeue()).toBe(1);
        # expect(queue.dequeue()).toBe(2);
        # expect(queue.dequeue()).toBeNull();
        # expect(queue.isEmpty()).toBeTruthy();
    }
}
