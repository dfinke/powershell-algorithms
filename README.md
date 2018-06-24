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

* [Linked List](src/data-structures/linked-list)
* [Queue](src/data-structures/queue)
* [Stack](src/data-structures/stack)
* [Hash Table](src/data-structures/hash-table)
* [Graph](src/data-structures/graph) (both directed and undirected)
* [Disjoint Set](src/data-structures/disjoint-set)

## Algorithms

An algorithm is an unambiguous specification of how to solve a class of problems. It is
a set of rules that precisely define a sequence of operations.

### Algorithms by Topic

* **Math**
  * [Factorial](src/algorithms/math/factorial)
  * [Fibonacci Number](src/algorithms/math/fibonacci)
  * [Primality Test](src/algorithms/math/primality-test) (trial division method)
  * [Euclidean Algorithm](src/algorithms/math/euclidean-algorithm) - calculate the Greatest Common Divisor (GCD)
  * [Least Common Multiple](src/algorithms/math/least-common-multiple) (LCM)
  * *~~[Integer Partition](src/algorithms/math/integer-partition)~~*
  * *~~[Sieve of Eratosthenes](src/algorithms/math/sieve-of-eratosthenes) - finding all prime numbers up to any given limit~~*
  * *~~[Is Power of Two](src/algorithms/math/is-power-of-two) - check if the number is power of two (naive and bitwise algorithms)~~*

* **Sets**

  * [Cartesian Product](src/algorithms/sets/cartesian-product) - product of multiple sets
  * [Power Set](src/algorithms/sets/power-set) - all subsets of a set
  * [Longest Common Subsequence](src/algorithms/sets/longest-common-subsequnce) (LCS)
  * [Longest Increasing subsequence](src/algorithms/sets/longest-increasing-subsequence)
  * `A` [Maximum Subarray](src/algorithms/sets/maximum-subarray) - "Brute Force" and "Dynamic Programming" (Kadane's) versions

* **Strings**

  * [Levenshtein Distance](src/algorithms/string/levenshtein-distance) - minimum edit distance between two sequences
  * [Hamming Distance](src/algorithms/string/hamming-distance) - number of positions at which the symbols are different
  * [Longest Common Substring](src/algorithms/string/longest-common-substring)

* **Searches**

  * [Linear Search](src/algorithms/search/linear-search)
  * [Binary Search](src/algorithms/search/binary-search)

* **Graphs**

  * [Bellman-Ford Algorithm](src/algorithms/graph/bellman-ford) - finding shortest path to all graph vertices

