. $PSScriptRoot\..\..\utils\comparator\Comparator.ps1

class MinHeap {

    hidden $heapContainer
    hidden $compare

    MinHeap() {
        $this.DoInit($null)
    }

    MinHeap($comparatorFunction) {
        $this.DoInit($comparatorFunction)
    }

    hidden DoInit($comparatorFunction) {
        $this.heapContainer = @()
        $this.compare = New-Object Comparator $comparatorFunction
    }

    # getLeftChildIndex(parentIndex) {
    #   return (2 * parentIndex) + 1;
    # }

    # getRightChildIndex(parentIndex) {
    #   return (2 * parentIndex) + 2;
    # }

    [object] getParentIndex($childIndex) {
        return [Math]::Floor(($childIndex - 1) / 2)
    }

    [bool] hasParent($childIndex) {
        return $this.getParentIndex($childIndex) -ge 0
    }

    # hasLeftChild(parentIndex) {
    #   return this.getLeftChildIndex(parentIndex) < this.heapContainer.length;
    # }

    # hasRightChild(parentIndex) {
    #   return this.getRightChildIndex(parentIndex) < this.heapContainer.length;
    # }

    # leftChild(parentIndex) {
    #   return this.heapContainer[this.getLeftChildIndex(parentIndex)];
    # }

    # rightChild(parentIndex) {
    #   return this.heapContainer[this.getRightChildIndex(parentIndex)];
    # }

    [object] parent($childIndex) {
      return $this.heapContainer[$this.getParentIndex($childIndex)]
    }

    swap($indexOne, $indexTwo) {
        $tmp = $this.heapContainer[$indexTwo];
        $this.heapContainer[$indexTwo] = $this.heapContainer[$indexOne]
        $this.heapContainer[$indexOne] = $tmp
    }

    [object] peek() {
        if ($this.heapContainer.count -eq 0) {
            return $null
        }

        return $this.heapContainer[0]
    }

    [object] poll() {
      if ($this.heapContainer.length -eq 0) {
        return $null
      }

      if ($this.heapContainer.length -eq 1) {
        return $this.heapContainer.pop()
      }

      $item = $this.heapContainer[0]

      # Move the last element from the end to the head.
      $this.heapContainer[0] = $this.heapContainer.pop()
      $this.heapifyDown()

      return $item
    }

    [object] add($item) {
        $this.heapContainer += $item
        $this.heapifyUp($null)

        return $this
    }

    # remove(item, customFindingComparator) {
    #   # Find number of items to remove.
    #   const customComparator = customFindingComparator || this.compare;
    #   const numberOfItemsToRemove = this.find(item, customComparator).length;

    #   for (let iteration = 0; iteration < numberOfItemsToRemove; iteration += 1) {
    #     # We need to find item index to remove each time after removal since
    #     # indices are being change after each heapify process.
    #     const indexToRemove = this.find(item, customComparator).pop();

    #     # If we need to remove last child in the heap then just remove it.
    #     # There is no need to heapify the heap afterwards.
    #     if (indexToRemove === (this.heapContainer.length - 1)) {
    #       this.heapContainer.pop();
    #     } else {
    #       # Move last element in heap to the vacant (removed) position.
    #       this.heapContainer[indexToRemove] = this.heapContainer.pop();

    #       # Get parent.
    #       const parentItem = this.hasParent(indexToRemove) ? this.parent(indexToRemove) : null;
    #       const leftChild = this.hasLeftChild(indexToRemove) ? this.leftChild(indexToRemove) : null;

    #       # If there is no parent or parent is less then node to delete then heapify down.
    #       # Otherwise heapify up.
    #       if (
    #         leftChild !== null &&
    #         (
    #           parentItem === null ||
    #           this.compare.lessThan(parentItem, this.heapContainer[indexToRemove])
    #         )
    #       ) {
    #         this.heapifyDown(indexToRemove);
    #       } else {
    #         this.heapifyUp(indexToRemove);
    #       }
    #     }
    #   }

    #   return this;
    # }

    # find(item, customComparator) {
    #   const foundItemIndices = [];
    #   const comparator = customComparator || this.compare;

    #   for (let itemIndex = 0; itemIndex < this.heapContainer.length; itemIndex += 1) {
    #     if (comparator.equal(item, this.heapContainer[itemIndex])) {
    #       foundItemIndices.push(itemIndex);
    #     }
    #   }

    #   return foundItemIndices;
    # }

    heapifyUp($customStartIndex) {
        # Take last element (last in array or the bottom left in a tree) in
        # a heap container and lift him up until we find the parent element
        # that is less then the current new one.

        $currentIndex = $customStartIndex
        if(!$customStartIndex) {
            $currentIndex = $this.heapContainer.Count - 1
        }

        while (
            $this.hasParent($currentIndex) -and
            $this.compare.lessThan($this.heapContainer[$currentIndex], $this.parent($currentIndex))
        ) {
            $this.swap($currentIndex, $this.getParentIndex($currentIndex))
            $currentIndex = $this.getParentIndex($currentIndex)
        }
    }

    # heapifyDown(customStartIndex) {
    #   # Compare the root element to its children and swap root with the smallest
    #   # of children. Do the same for next children after swap.
    #   let currentIndex = customStartIndex || 0;
    #   let nextIndex = null;

    #   while (this.hasLeftChild(currentIndex)) {
    #     if (
    #       this.hasRightChild(currentIndex) &&
    #       this.compare.lessThan(this.rightChild(currentIndex), this.leftChild(currentIndex))
    #     ) {
    #       nextIndex = this.getRightChildIndex(currentIndex);
    #     } else {
    #       nextIndex = this.getLeftChildIndex(currentIndex);
    #     }

    #     if (this.compare.lessThan(this.heapContainer[currentIndex], this.heapContainer[nextIndex])) {
    #       break;
    #     }

    #     this.swap(currentIndex, nextIndex);
    #     currentIndex = nextIndex;
    #   }
    # }

    [bool] isEmpty() {
        return !$this.heapContainer.Count
    }

    [string] toString() {
        return $this.heapContainer -join ','
        # return $this.heapContainer.toString()
    }
}