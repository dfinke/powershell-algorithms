function trialDivision([double]$number) {
    # Check if number is integer.
    if ($number % 1 -ne 0) {
        return $false
    }

    if ($number -le 1) {
        # If number is less than one then it isn't prime by definition.
        return $false
    }
    elseif ($number -le 3) {
        # All numbers from 2 to 3 are prime.
        return $true
    }

    # If the number is not divided by 2 then we may eliminate all further even dividers.
    if ($number % 2 -eq 0) {
        return $false
    }

    # If there is no dividers up to square root of n then there is no higher dividers as well.
    $dividerLimit = [Math]::Sqrt($number)
    for ($divider = 3; $divider -le $dividerLimit; $divider += 2) {
        if ($number % $divider -eq 0) {
            return $false
        }
    }

    $true
}