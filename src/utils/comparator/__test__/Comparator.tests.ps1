. $PSScriptRoot\..\comparator.ps1

describe 'Comparator' {
    it 'should compare with default comparator function' {
        $comparator = New-Object Comparator

        $comparator.equal(0, 0) | Should Be $true
        $comparator.equal(0, 1) | Should Be $false
        $comparator.equal('a', 'a') | Should Be $true
        $comparator.lessThan(1, 2) | Should Be $true
        $comparator.lessThan(-1, 2) | Should Be $true
        $comparator.lessThan('a', 'b') | Should Be $true
        $comparator.lessThan('a', 'ab') | Should Be $true
        $comparator.lessThan(10, 2) | Should Be $false
        $comparator.lessThanOrEqual(10, 2) | Should Be $false
        $comparator.lessThanOrEqual(1, 1) | Should Be $true
        $comparator.lessThanOrEqual(0, 0) | Should Be $true
        $comparator.greaterThan(0, 0) | Should Be $false
        $comparator.greaterThan(10, 0) | Should Be $true
        $comparator.greaterThanOrEqual(10, 0) | Should Be $true
        $comparator.greaterThanOrEqual(10, 10) | Should Be $true
        $comparator.greaterThanOrEqual(0, 10) | Should Be $false
    }

    it 'should compare with custom comparator function' {
        $comparator = [Comparator]::new( {
                param($a, $b)
                if ($a.length -eq $b.length) {
                    return 0
                }

                if ($a.length -lt $b.length) { return -1 }

                return 1
            })

        $comparator.equal('a', 'b') | Should Be $True
        $comparator.equal('a', '') | Should Be $false
        $comparator.lessThan('b', 'aa') | Should Be $True
        $comparator.greaterThanOrEqual('a', 'aa') | Should Be $false
        $comparator.greaterThanOrEqual('aa', 'a') | Should Be $True
        $comparator.greaterThanOrEqual('a', 'a') | Should Be $True

        $comparator.reverse()

        $comparator.equal('a', 'b') | Should Be $true
        $comparator.equal('a', '') | Should Be $false
        $comparator.lessThan('b', 'aa') | Should Be $false
        $comparator.greaterThanOrEqual('a', 'aa') | Should Be $true
        $comparator.greaterThanOrEqual('aa', 'a') | Should Be $false
        $comparator.greaterThanOrEqual('a', 'a') | Should Be $true
    }
}