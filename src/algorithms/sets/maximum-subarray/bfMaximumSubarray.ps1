function bfMaximumSubarray($inputArray) {
    $maxSubarrayStartIndex = 0
    $maxSubarrayLength = 0
    $maxSubarraySum = $null

    for ($startIndex = 0; $startIndex -lt $inputArray.Count; $startIndex += 1) {
        $subarraySum = 0
        for ($arrLength = 1; $arrLength -lt ($inputArray.Count - $startIndex); $arrLength += 1) {
            $subarraySum += $inputArray[$startIndex + ($arrLength - 1)]
            if ($maxSubarraySum -eq $null -or $subarraySum -gt $maxSubarraySum) {
                $maxSubarraySum = $subarraySum
                $maxSubarrayStartIndex = $startIndex
                $maxSubarrayLength = $arrLength
            }
        }
    }

    # return inputArray.slice(maxSubarrayStartIndex, maxSubarrayStartIndex + maxSubarrayLength);
    $inputArray[$maxSubarrayStartIndex..($maxSubarrayStartIndex + $maxSubarrayLength - 1)].clone()
}
