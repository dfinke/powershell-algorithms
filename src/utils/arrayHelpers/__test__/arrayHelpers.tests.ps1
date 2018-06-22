. $PSScriptRoot\..\arrayHelpers.ps1

describe "Array helpers" {

    it "pop-array should not throw an error for an empty array" {
        [System.Collections.ArrayList]$list = @()

        {Pop-Array $list} | Should Not Throw
    }

    it "pop-array should return items last in first out" {
        [System.Collections.ArrayList] $list = Write-Output A B C

        Pop-Array $list | Should Be 'C'
        Pop-Array $list | Should Be 'B'
        Pop-Array $list | Should Be 'A'
        Pop-Array $list | Should Be $null
    }

    it "pop-array should throw if array is not an arraylist" {
        $list = Write-Output A B C

        {Pop-Array $list} | Should Throw 'Array is not an ArrayList'
    }

    # it "shift-array should not throw an error for an empty array" {
    #     [System.Collections.ArrayList]$list = @()

    #     {Shift-Array $list} | Should Not Throw
    # }
}