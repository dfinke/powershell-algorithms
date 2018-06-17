class DisjointSetItem {
    hidden $value
    hidden [scriptblock]$keyCallback
    hidden $parent
    hidden [hashtable]$children

    DisjointSetItem($value) {
        $this.DoInit($value, $null)
    }

    DisjointSetItem($value, [scriptblock]$keyCallback) {
        $this.DoInit($value, $keyCallback)
    }

    DoInit($value, [scriptblock]$keyCallback) {
        $this.value = $value
        $this.keyCallback = $keyCallback
        $this.parent = $null
        $this.children = @{}
    }

    [object] getKey() {
        # Allow user to define custom key generator.
        if ($this.keyCallback) {
            return & $this.keyCallback $this.value
        }

        # Otherwise use value as a key by default.
        return $this.value
    }


    [object] getRoot() {
        if ($this.isRoot()) {
            return $this
        }

        return $this.parent.getRoot()
    }

    [bool] isRoot() {
        return $this.parent -eq $null
    }

    [object] getRank() {
        if ($this.getChildren().Count -eq 0) {
            return 0
        }

        $rank = 0

        foreach ($child in $this.getChildren()) {
            $rank += 1
            $rank += $child.getRank()
        }

        return $rank
    }


    [object] getChildren() {
        return $this.children.Values
    }


    [object] setParent($parentItem) {
        return $this.setParent($parentItem, $true)
    }

    [object] setParent($parentItem, $forceSettingParentChild) {
        $this.parent = $parentItem

        if ($forceSettingParentChild) {
            $parentItem.addChild($this)
        }

        return $this
    }

    [object] addChild($childItem) {
        $this.children[$childItem.getKey()] = $childItem
        $childItem.setParent($this, $false)

        return $this
    }
}