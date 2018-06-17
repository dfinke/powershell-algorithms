# detecting cycles

. $PSScriptRoot\..\src\data-structures\disjoint-set\DisjointSet.ps1

$disjointSet = New-Object DisjointSet

1..8 | ForEach-Object { $null = $disjointSet.makeSet($_) } # 8 Vertices in universal set

$edge1=$disjointSet.union(1,2)
$edge2=$disjointSet.union(3,4)
$edge3=$disjointSet.union(5,6)
$edge4=$disjointSet.union(7,8)

$disjointSet.inSameSet(2,4) # false
$edge5=$disjointSet.union(2,4)
$disjointSet.inSameSet(2,4) # true
''
$disjointSet.inSameSet(2,5) # false
$disjointSet.inSameSet(3,6) # false
$edge6=$disjointSet.union(2,5)
$disjointSet.inSameSet(2,5) # true
$disjointSet.inSameSet(3,6) # true
''
$disjointSet.inSameSet(5,7) # false
$disjointSet.inSameSet(4,8) # false
$disjointSet.inSameSet(6,8) # false
$null=$disjointSet.union(5,7)
$disjointSet.inSameSet(5,7) # true
$disjointSet.inSameSet(4,8) # true
$disjointSet.inSameSet(6,8) # true