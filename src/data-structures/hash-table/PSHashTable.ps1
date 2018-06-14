. $PSScriptRoot\..\linked-list\LinkedList.ps1

# Hash table size directly affects on the number of collisions.
# The bigger the hash table size the less collisions you'll get.
# For demonstrating purposes hash table size is small to show how collisions
# are being handled.

class PSHashTable {
    hidden $defaultHashTableSize = 32

    $buckets = @()
    hidden $keys

    PSHashTable() {
        $this.DoInit($this.defaultHashTableSize)
    }

    PSHashTable($defaultHashTableSize) {
        $this.DoInit($defaultHashTableSize)
    }

    hidden DoInit($hashTableSize) {
        $this.buckets = (0..($hashTableSize - 1)).ForEach( {New-Object LinkedList} )
        $this.keys = [Ordered]@{}
    }

    [object] hash($key) {
        [int]$hash = 0

        foreach ($c in $key.ToCharArray()) {$hash += [int]$c}

        return $hash % $this.buckets.Count
    }

    set($key, $value) {
        $keyHash = $this.hash($key)
        $this.keys[$key] = $keyHash
        $bucketLinkedList = $this.buckets[$keyHash]

        $node = $bucketLinkedList.Find( {
                param($nodeValue)

                if ($nodeValue.key -eq $key) {
                    $nodeValue
                }
            })

        if (!$node) {
            # Insert new node
            $bucketLinkedList.append( @{ key = $key; value = $value })
        }
        else {
            # Update value of existing node
            $node.value.value = $value
        }
    }


    [object] delete($key) {
        $keyHash = $this.hash($key)
        $this.keys.Remove($key)

        $bucketLinkedList = $this.buckets[$keyHash]
        $node = $bucketLinkedList.find( {
                param($nodeValue)

                if ($nodeValue.key -eq $key) {
                    $nodeValue
                }
            });

        if ($node) {
            return $bucketLinkedList.delete($node.value)
        }

        return $null
    }


    [object] get($key) {
        $bucketLinkedList = $this.buckets[$this.hash($key)]
        $node = $bucketLinkedList.find( {
                param($nodeValue)

                if ($nodeValue.key -eq $key) {
                    $nodeValue
                }
            });

        if ($node) {
            return $node.value.value
        }

        return $null
    }

    [object] has($key) {
        return $this.keys.Contains($key)
    }

    [object] getKeys() {
        return $this.keys.Keys #| sort
    }
}
