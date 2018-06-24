. $PSScriptRoot\..\bfMaximumSubarray.ps1

describe 'bfMaximumSubarray' {
    it 'should find maximum subarray using brute force algorithm' {
        bfMaximumSubarray @() | Should Be @()
        bfMaximumSubarray @(-1, -2, -3, -4, -5) | Should Be @(-1)
        #bfMaximumSubarray @(1, 2, 3, 2, 3, 4, 5) | Should Be @(1, 2, 3, 2, 3, 4, 5)
        bfMaximumSubarray @(1, 2, 3, 2, 3, 4, 5) | Should Be @(1, 2, 3, 2, 3, 4)
        bfMaximumSubarray @(-2, 1, -3, 4, -1, 2, 1, -5, 4) | Should Be @(4, -1, 2, 1)
        bfMaximumSubarray @(-2, -3, 4, -1, -2, 1, 5, -3) | Should Be @(4, -1, -2, 1, 5)
        bfMaximumSubarray @(1, -3, 2, -5, 7, 6, -1, 4, 11, -23) | Should Be @(7, 6, -1, 4, 11)
    }
}