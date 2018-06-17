. $PSScriptRoot\DisjointSetItem.ps1

class DisjointSet {

    hidden [scriptblock]$keyCallback
    hidden [hashtable]$items

    DisjointSet() {
        $this.DoInit($null)
    }

    DisjointSet([scriptblock]$keyCallback) {
        $this.DoInit($keyCallback)
    }

    hidden DoInit([scriptblock]$keyCallback) {
        $this.keyCallback = $keyCallback
        $this.items = @{}
    }

    [object] makeSet($itemValue) {
        $disjointSetItem = New-Object DisjointSetItem($itemValue, $this.keyCallback);

        if (!$this.items[$disjointSetItem.getKey()]) {
            # Add new item only in case if it not presented yet.
            $this.items[$disjointSetItem.getKey()] = $disjointSetItem
        }

        return $this
    }

    [object] find($itemValue) {
        $templateDisjointItem = New-Object DisjointSetItem($itemValue, $this.keyCallback)

        # Try to find item itself;
        $requiredDisjointItem = $this.items[$templateDisjointItem.getKey()]

        if (!$requiredDisjointItem) {
            return $null
        }

        return $requiredDisjointItem.getRoot().getKey()
    }

    [object] union($valueA, $valueB) {
        $rootKeyA = $this.find($valueA)
        $rootKeyB = $this.find($valueB)

        if ($rootKeyA -eq $null -or $rootKeyB -eq $null) {
            throw 'One or two values are not in sets'
        }

        if ($rootKeyA -eq $rootKeyB) {
            # In case if both elements are already in the same set then just return its key.
            return $this
        }

        $rootA = $this.items[$rootKeyA]
        $rootB = $this.items[$rootKeyB]

        if ($rootA.getRank() -lt $rootB.getRank()) {
            # If rootB's tree is bigger then make rootB to be a new root.
            $rootB.addChild($rootA)

            return $rootB.getKey()
        }

        # If rootA's tree is bigger then make rootA to be a new root.
        $rootA.addChild($rootB)

        return $this
    }

    [bool] inSameSet($valueA, $valueB) {
        $rootKeyA = $this.find($valueA)
        $rootKeyB = $this.find($valueB)

        if ($rootKeyA -eq $null -or $rootKeyB -eq $null) {
            throw 'One or two values are not in sets'
        }

        return $rootKeyA -eq $rootKeyB
    }
}
