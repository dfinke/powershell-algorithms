Import-Module $PSScriptRoot\..\fibonacci.psm1 -Force

Describe 'fibonacciNth' {
    it 'should calculate fibonacciNth correctly' {
        fibonacciNth 1 | Should Be 1
        fibonacciNth 2 | Should Be 1
        fibonacciNth 3 | Should Be 2
        fibonacciNth 4 | Should Be 3
        fibonacciNth 5 | Should Be 5
        fibonacciNth 6 | Should Be 8
        fibonacciNth 7 | Should Be 13
        fibonacciNth 8 | Should Be 21
        fibonacciNth 20 | Should Be 6765
    }
}