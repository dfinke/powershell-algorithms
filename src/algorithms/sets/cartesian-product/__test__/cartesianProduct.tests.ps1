. $PSScriptRoot\..\cartesianProduct.ps1

describe 'cartesianProduct' {
    it 'should return null if there is not enough info for calculation' {
        $product1 = cartesianProduct 1 $null
        $product2 = cartesianProduct @() $null

        $product1 | Should Be $null
        $product2 | Should Be $null
    }

    it 'should calculate the product of two sets' {
        $product1 = cartesianProduct 1 1
        $product2 = cartesianProduct 1, 2 3, 5

        $product1.Count | Should Be 2
        $product1[0] | Should Be 1
        $product1[1] | Should Be 1

        $product2.Count | Should Be 8
    
        $product2[0] | Should Be 1
        $product2[1] | Should Be 3
        $product2[2] | Should Be 1
        $product2[3] | Should Be 5
        $product2[4] | Should Be 2
        $product2[5] | Should Be 3
        $product2[6] | Should Be 2
        $product2[7] | Should Be 5
    }
}
