function Pop-Array {
    param(
        $targetArray
    )

    if ($targetArray -isnot [System.Collections.ArrayList]) {
        throw "Array is not an ArrayList"
    }

    $index = $targetArray.Count - 1

    if ($index -ge 0) {
        $targetArray[$index]
        $targetArray.RemoveAt($index)
    }
}

# function Shift-Array {
#     param(
#         $targetArray
#     )

#     if ($targetArray -isnot [System.Collections.ArrayList]) {
#         throw "Array is not an ArrayList"
#     }

#     $index = 1

#     if ($index -gt $targetArray.Count) {
#         $targetArray[$index]
#         $targetArray.RemoveAt($index)
#     }
# }