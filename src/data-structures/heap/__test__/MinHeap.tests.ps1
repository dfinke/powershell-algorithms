. $PSScriptRoot\..\MinHeap.ps1
. $PSScriptRoot\..\..\..\utils\comparator\Comparator.ps1

describe 'MinHeap' {
    it 'should create an empty min heap' {
        $minHeap = New-Object MinHeap

        $minHeap | Should Not BeNullOrEmpty
        $minHeap.peek() | Should Be $null
        $minHeap.isEmpty() | Should Be $true
    }

    it 'should add items to the heap and heapify it up' {
        $minHeap = New-Object MinHeap

        $minHeap.add(5)
        $minHeap.isEmpty() | Should Be $false
        $minHeap.peek() | Should Be 5
        $minHeap.toString() | Should Be '5'

        $minHeap.add(3);
        $minHeap.peek() | Should Be 3
        $minHeap.toString() | Should Be '3,5'

        $minHeap.add(10)
        $minHeap.peek()  | Should Be 3
        $minHeap.toString() | Should Be '3,5,10'

        $minHeap.add(1)
        $minHeap.peek() | Should Be 1
        $minHeap.toString() | Should Be '1,3,10,5'

        $minHeap.add(1)
        $minHeap.peek() | Should Be 1
        $minHeap.toString() | Should Be '1,1,10,5,3'

        $minHeap.poll() | Should Be 1
        $minHeap.toString() | Should Be '1,3,10,5'

        $minHeap.poll() | Should Be 1
        $minHeap.toString() | Should Be '3,5,10'

        $minHeap.poll() | Should Be 3
        $minHeap.toString() | Should Be '5,10'
    }

    it 'should poll items from the heap and heapify it down' {
        # $minHeap = New-Object MinHeap

        # minHeap.add(5);
        # minHeap.add(3);
        # minHeap.add(10);
        # minHeap.add(11);
        # minHeap.add(1);

        # expect(minHeap.toString()).toBe('1,3,10,11,5');

        # expect(minHeap.poll()).toBe(1);
        # expect(minHeap.toString()).toBe('3,5,10,11');

        # expect(minHeap.poll()).toBe(3);
        # expect(minHeap.toString()).toBe('5,11,10');

        # expect(minHeap.poll()).toBe(5);
        # expect(minHeap.toString()).toBe('10,11');

        # expect(minHeap.poll()).toBe(10);
        # expect(minHeap.toString()).toBe('11');

        # expect(minHeap.poll()).toBe(11);
        # expect(minHeap.toString()).toBe('');

        # expect(minHeap.poll()).toBeNull();
        # expect(minHeap.toString()).toBe('');
    }

    it 'should heapify down through the right branch as well' {
        # $minHeap = New-Object MinHeap

        # minHeap.add(3);
        # minHeap.add(12);
        # minHeap.add(10);

        # expect(minHeap.toString()).toBe('3,12,10');

        # minHeap.add(11);
        # expect(minHeap.toString()).toBe('3,11,10,12');

        # expect(minHeap.poll()).toBe(3);
        # expect(minHeap.toString()).toBe('10,11,12');
    }

    it 'should be possible to find item indices in heap' {
        # $minHeap = New-Object MinHeap

        # minHeap.add(3);
        # minHeap.add(12);
        # minHeap.add(10);
        # minHeap.add(11);
        # minHeap.add(11);

        # expect(minHeap.toString()).toBe('3,11,10,12,11');

        # expect(minHeap.find(5)).toEqual([]);
        # expect(minHeap.find(3)).toEqual([0]);
        # expect(minHeap.find(11)).toEqual([1, 4]);
    }

    it 'should be possible to remove items from heap with heapify down' {
        # $minHeap = New-Object MinHeap

        # minHeap.add(3);
        # minHeap.add(12);
        # minHeap.add(10);
        # minHeap.add(11);
        # minHeap.add(11);

        # expect(minHeap.toString()).toBe('3,11,10,12,11');

        # expect(minHeap.remove(3).toString()).toEqual('10,11,11,12');
        # expect(minHeap.remove(3).peek()).toEqual(10);
        # expect(minHeap.remove(11).toString()).toEqual('10,12');
        # expect(minHeap.remove(3).peek()).toEqual(10);
    }

    it 'should be possible to remove items from heap with heapify up' {
        # $minHeap = New-Object MinHeap

        # minHeap.add(3);
        # minHeap.add(10);
        # minHeap.add(5);
        # minHeap.add(6);
        # minHeap.add(7);
        # minHeap.add(4);
        # minHeap.add(6);
        # minHeap.add(8);
        # minHeap.add(2);
        # minHeap.add(1);

        # expect(minHeap.toString()).toBe('1,2,4,6,3,5,6,10,8,7');
        # expect(minHeap.remove(8).toString()).toEqual('1,2,4,6,3,5,6,10,7');
        # expect(minHeap.remove(7).toString()).toEqual('1,2,4,6,3,5,6,10');
        # expect(minHeap.remove(1).toString()).toEqual('2,3,4,6,10,5,6');
        # expect(minHeap.remove(2).toString()).toEqual('3,6,4,6,10,5');
        # expect(minHeap.remove(6).toString()).toEqual('3,5,4,10');
        # expect(minHeap.remove(10).toString()).toEqual('3,5,4');
        # expect(minHeap.remove(5).toString()).toEqual('3,4');
        # expect(minHeap.remove(3).toString()).toEqual('4');
        # expect(minHeap.remove(4).toString()).toEqual('');
    }

    it 'should be possible to remove items from heap with custom finding comparator' {
        # $minHeap = New-Object MinHeap

        # minHeap.add('dddd');
        # minHeap.add('ccc');
        # minHeap.add('bb');
        # minHeap.add('a');

        # expect(minHeap.toString()).toBe('a,bb,ccc,dddd');

        # const comparator = new Comparator((a, b) => {
        #   if (a.length === b.length) {
        #     return 0;
        #   }

        #   return a.length < b.length ? -1 : 1;
        # }

        # minHeap.remove('hey', comparator);
        # expect(minHeap.toString()).toBe('a,bb,dddd');
    }
}
