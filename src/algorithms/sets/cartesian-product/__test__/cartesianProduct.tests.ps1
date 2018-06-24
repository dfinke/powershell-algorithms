. $PSScriptRoot\..\cartesianProduct.ps1

describe 'cartesianProduct' {
    it 'should return null if there is not enough info for calculation' {
        $product1 = cartesianProduct 1 $null
        $product2 = cartesianProduct @() $null

        $product1 | Should Be $null
        $product2 | Should Be $null
    }

    it 'should calculate the product of two sets' {
        $product1 = cartesianProduct @(1) @(1)
        $product2 = cartesianProduct @(1, 2) @(3, 5)

        $product1 | Should Be @(1, 1)
        $product2 | Should Be @(
            @(1, 3),
            @(1, 5),
            @(2, 3),
            @(2, 5)
        )
    }
}
