. $PSScriptRoot\..\PSHashTable.ps1

describe 'PSHashTable' {
    it 'should create hash table of certain size' {
        $defaultHashTable = [PSHashTable]::new()
        $defaultHashTable.buckets.Count | Should Be 32

        $biggerHashTable = [PSHashTable]::new(64)
        $biggerHashTable.buckets.Count | Should Be 64
    }

    it 'should generate proper hash for specified keys' {
        $hashTable = [PSHashTable]::new()

        $hashTable.hash('a') | Should Be 1
        $hashTable.hash('b') | Should Be 2
        $hashTable.hash('abc') | Should Be 6
    }

    it 'should set, read and delete data with collisions' {
        $hashTable = [PSHashTable]::new(3)

        $hashTable.hash('a') | Should Be 1
        $hashTable.hash('b') | Should Be 2
        $hashTable.hash('c') | Should Be 0
        $hashTable.hash('d') | Should Be 1

        $hashTable.set('a', 'sky-old')
        $hashTable.set('a', 'sky')
        $hashTable.set('b', 'sea')
        $hashTable.set('c', 'earth')
        $hashTable.set('d', 'ocean')

        $hashTable.has('x') | Should Be $false
        $hashTable.has('b') | Should Be $true
        $hashTable.has('c') | Should Be $true

        #     const stringifier = value => `${value.key}:${value.value}`;

        #     expect(hashTable.buckets[0].toString(stringifier)).toBe('c:earth');
        #     expect(hashTable.buckets[1].toString(stringifier)).toBe('a:sky,d:ocean');
        #     expect(hashTable.buckets[2].toString(stringifier)).toBe('b:sea');

        $hashTable.get('a') | Should Be 'sky'
        $hashTable.get('d') | Should Be 'ocean'
        $hashTable.get('x') | Should BeNullOrEmpty

        $hashTable.delete('a')

        $hashTable.delete('not-existing') | Should be $null

        $hashTable.get('a') | Should BeNullOrEmpty
        $hashTable.get('d') | Should be 'ocean'

        $hashTable.set('d', 'ocean-new')

        $hashTable.get('d') | Should Be 'ocean-new'
    }

    it 'should be possible to add objects to hash table' {
        $hashTable = [PSHashTable]::new(3)

        $hashTable.set('objectKey', @{ prop1 = 'a'; prop2 = 'b' })

        $object = $hashTable.get('objectKey')
        $object | Should Not BeNullOrEmpty
        $object.prop1 | Should Be 'a'
        $object.prop2 | Should Be 'b'
    }

    it 'should track actual keys' {
        $hashTable = [PSHashTable]::new(3)

        $hashTable.set('a', 'sky-old')
        $hashTable.set('a', 'sky')
        $hashTable.set('b', 'sea')
        $hashTable.set('c', 'earth')
        $hashTable.set('d', 'ocean')

        $hashTable.getKeys() | Should Be @('a', 'b', 'c', 'd')

        $hashTable.has('a') | Should Be $true
        $hashTable.has('x') | Should Be $false

        $hashTable.delete('a');

        $hashTable.has('a') | Should Be $false
        $hashTable.has('b') | Should Be $true
        $hashTable.has('x') | Should Be $false
    }
}