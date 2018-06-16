class Comparator {
    hidden [scriptblock]$compare
    hidden [scriptblock]$compareOriginal

    Comparator() {
        $this.compare = {
            param($a, $b)

            if ($a -eq $b) { return 0 }
            if ($a -lt $b) { return -1 }

            return 1
        }
    }

    Comparator([scriptblock]$compareFunction) {
        $this.compare = $compareFunction
    }

    [int] equal($a, $b) {
        return (& $this.compare $a $b) -eq 0
    }

    [int] lessThan($a, $b) {
        return (& $this.compare $a $b) -lt 0
    }

    [int] greaterThan($a, $b) {
        return (& $this.compare $a $b) -gt 0
    }

    [int] lessThanOrEqual($a, $b) {
        return $this.lessThan($a, $b) -Or $this.equal($a, $b)
    }

    [int] greaterThanOrEqual($a, $b) {
        return $this.greaterThan($a, $b) -Or $this.equal($a, $b)
    }

    reverse() {
        $this.compareOriginal = $this.compare

        $this.compare = {
            param($a, $b)

            &$this.compareOriginal $b $a
        }
    }
}