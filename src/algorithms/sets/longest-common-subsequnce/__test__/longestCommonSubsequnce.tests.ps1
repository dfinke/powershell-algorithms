. $PSScriptRoot\..\longestCommonSubsequnce.ps1

describe 'longestCommonSubsequnce' {
    it 'should find longest common subsequence for two strings' {

        longestCommonSubsequnce @('') @('') | Should Be @('')
        longestCommonSubsequnce @('') @('A', 'B', 'C') | Should Be @('')
        longestCommonSubsequnce @('A', 'B', 'C') @('') | Should Be @('')

        longestCommonSubsequnce @('A', 'B', 'C') @('D', 'E', 'F', 'G') | Should Be @('')

        longestCommonSubsequnce @('A', 'B', 'C', 'D', 'G', 'H') @('A', 'E', 'D', 'F', 'H', 'R') | Should Be @('A', 'D', 'H')

        longestCommonSubsequnce @('A', 'G', 'G', 'T', 'A', 'B') @('G', 'X', 'T', 'X', 'A', 'Y', 'B') | Should Be @('G', 'T', 'A', 'B')

        longestCommonSubsequnce @('A', 'B', 'C', 'D', 'A', 'F') @('A', 'C', 'B', 'C', 'F') | Should Be @('A', 'B', 'C', 'F')
    }
}
