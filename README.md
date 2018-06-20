[![Build status](https://ci.appveyor.com/api/projects/status/5mgmde3n31mf9x2a?svg=true)](https://ci.appveyor.com/project/dfinke/powershell-algorithms)

# PowerShell Algorithms and Data Structures

Algorithms and data structures implemented in PowerShell with explanations and links to further readings

> This is a port of https://github.com/trekhleb/javascript-algorithms

This repository contains PowerShell based examples of many popular algorithms and data structures.

Each algorithm and data structure has its own separate README with related explanations and links for further reading (including ones to YouTube videos).

## How to use this repository

**Run all tests**

```powershell
Invoke-Pester
```

**Run tests by name**

```powershell
Invoke-Pester -TestName LinkedList
```

## Data Structures

A data structure is a particular way of organizing and storing data in a computer so that it can be accessed and modified efficiently. More precisely, a data structure is a collection of data values, the relationships among them, and the functions or operations that can be applied to the data.

* [Linked List](https://github.com/dfinke/powershell-algorithms/tree/master/src/data-structures/linked-list)
* [Queue](https://github.com/dfinke/powershell-algorithms/tree/master/src/data-structures/queue)
* [Stack](https://github.com/dfinke/powershell-algorithms/tree/master/src/data-structures/stack)
* [Hash Table](https://github.com/dfinke/powershell-algorithms/tree/master/src/data-structures/hash-table)
* [Graph](https://github.com/dfinke/powershell-algorithms/tree/master/src/data-structures/graph) (both directed and undirected)
* [Disjoint Set](https://github.com/dfinke/powershell-algorithms/tree/master/src/data-structures/disjoint-set)

## Algorithms

An algorithm is an unambiguous specification of how to solve a class of problems. It is
a set of rules that precisely define a sequence of operations.

### Algorithms by Topic

* **Math**
  * [Factorial](https://github.com/dfinke/powershell-algorithms/tree/master/src/algorithms/math/factorial)
  * [Fibonacci Number](https://github.com/dfinke/powershell-algorithms/tree/master/src/algorithms/math/fibonacci)
  * [Primality Test](https://github.com/dfinke/powershell-algorithms/tree/master/src/algorithms/math/primality-test) (trial division method)
  * [Euclidean Algorithm](https://github.com/dfinke/powershell-algorithms/tree/master/src/algorithms/math/euclidean-algorithm) - calculate the Greatest Common Divisor (GCD)
  * [Least Common Multiple](https://github.com/dfinke/powershell-algorithms/tree/master/src/algorithms/math/least-common-multiple) (LCM)
  * *~~[Integer Partition](https://github.com/dfinke/powershell-algorithms/tree/master/src/algorithms/math/integer-partition)~~*
  * *~~[Sieve of Eratosthenes](https://github.com/dfinke/powershell-algorithms/tree/master/src/algorithms/math/sieve-of-eratosthenes) - finding all prime numbers up to any given limit~~*
  * *~~[Is Power of Two](https://github.com/dfinke/powershell-algorithms/tree/master/src/algorithms/math/is-power-of-two) - check if the number is power of two (naive and bitwise algorithms)~~*

* **Sets**

  * [Cartesian Product](https://github.com/dfinke/powershell-algorithms/tree/master/src/algorithms/sets/cartesian-product) - product of multiple sets

* **Strings**

  * [Levenshtein Distance](https://github.com/dfinke/powershell-algorithms/tree/master/src/algorithms/string/levenshtein-distance) - minimum edit distance between two sequences
  * [Hamming Distance](https://github.com/dfinke/powershell-algorithms/tree/master/src/algorithms/string/hamming-distance) - number of positions at which the symbols are different
  * [Longest Common Substring](https://github.com/dfinke/powershell-algorithms/tree/master/src/algorithms/string/longest-common-substring)

* **Searches**
  * [Linear Search](https://github.com/dfinke/powershell-algorithms/tree/master/src/algorithms/search/linear-search)
  * [Binary Search](https://github.com/dfinke/powershell-algorithms/tree/master/src/algorithms/search/binary-search)
