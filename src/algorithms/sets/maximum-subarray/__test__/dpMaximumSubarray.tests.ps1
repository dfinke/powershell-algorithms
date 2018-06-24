. $PSScriptRoot\..\dpMaximumSubarray.ps1

describe 'dpMaximumSubarray' {
    it 'should find maximum subarray using dynamic programming algorithm' {
        dpMaximumSubarray @() | Should Be @()
        dpMaximumSubarray @(-1, -2, -3, -4, -5) | Should Be @(-1)
        dpMaximumSubarray @(1, 2, 3, 2, 3, 4, 5) | Should Be @(1, 2, 3, 2, 3, 4, 5)
        dpMaximumSubarray @(-2, 1, -3, 4, -1, 2, 1, -5, 4) | Should Be @(4, -1, 2, 1)
        dpMaximumSubarray @(-2, -3, 4, -1, -2, 1, 5, -3) | Should Be @(4, -1, -2, 1, 5)
        dpMaximumSubarray @(1, -3, 2, -5, 7, 6, -1, 4, 11, -23) | Should Be @(7, 6, -1, 4, 11)
    }
}