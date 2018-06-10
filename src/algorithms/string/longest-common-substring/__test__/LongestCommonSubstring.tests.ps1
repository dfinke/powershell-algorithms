
. $PSScriptRoot\..\longestCommonSubstring.ps1

describe 'longestCommonSubstring' {
    it 'should find longest common substring between two strings' {
        longestCommonSubstring '' '' | Should Be ''
        longestCommonSubstring 'ABC' '' | Should Be ''
        longestCommonSubstring '' 'ABC' | Should Be ''
        longestCommonSubstring 'ABABC' 'BABCA' | Should Be 'BABC'
        longestCommonSubstring 'BABCA' 'ABCBA' | Should Be 'ABC'
    }
}