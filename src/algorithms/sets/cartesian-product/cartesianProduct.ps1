function cartesianProduct([object[]]$setA, [object[]]$setB) {
    if (!$setA -or !$setB -or !$setA.length -or !$setB.length) {
        return $null
    }

    $product = @()

    for ($indexA = 0; $indexA -lt $setA.length; $indexA += 1) {
        for ($indexB = 0; $indexB -lt $setB.length; $indexB += 1) {
            $product += ,@($setA[$indexA], $setB[$indexB])
        }
    }

    $product
}
