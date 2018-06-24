function dpMaximumSubarray($inputArray) {
    # Check if all elements of inputArray are negative ones and return the highest
    # one in this case.
    $allNegative = $true
    $highestElementValue = $null
    for ($i = 0; $i -lt $inputArray.Count; $i += 1) {
        if ($inputArray[$i] -ge 0) {
            $allNegative = $false
        }

        if ($highestElementValue -eq $null -or $highestElementValue -lt $inputArray[$i]) {
            $highestElementValue = $inputArray[$i]
        }
    }

    if ($allNegative -and $highestElementValue -ne $null) {
        return @($highestElementValue)
    }

    # Let's assume that there is at list one positive integer exists in array.
    # And thus the maximum sum will for sure be grater then 0. Thus we're able
    # to always reset max sum to zero.
    $maxSum = 0

    # This array will keep a combination that gave the highest sum.
    $maxSubArray = @()

    # Current sum and subarray that will memoize all previous computations.
    $currentSum = 0
    $currentSubArray = @()

    for ($i = 0; $i -lt $inputArray.Count; $i += 1) {
        # Let's add current element value to the current sum.
        $currentSum += $inputArray[$i]

        if ($currentSum -lt 0) {
            # If the sum went below zero then reset it and don't add current element to max subarray.
            $currentSum = 0
            # Reset current subarray.
            $currentSubArray = @()
        }
        else {
            # If current sum stays positive then add current element to current sub array.
            $currentSubArray += $inputArray[$i]

            if ($currentSum -gt $maxSum) {
                # If current sum became greater then max registered sum then update
                # max sum and max subarray.
                $maxSum = $currentSum
                $maxSubArray = $currentSubArray.Clone()
            }
        }
    }

    $maxSubArray
}
