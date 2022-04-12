# Haskell

# Heap Sort Algorithm for sorting in Increasing Order

**_What is Heap sort?_**

  Heap sort is a comparison-based sorting technique based on Binary Heap data structure. It is similar to selection sort where we first find the minimum element and place the minimum element at the beginning. We repeat the same process for the remaining elements.

**_What is Binary Heap?_**

  A Binary Heap is a Complete Binary Tree where items are stored in a special order such that the value in a parent node is greater(or smaller) than the values in its two children nodes. The former is called max heap and the latter is called min-heap. The heap can be represented by a binary tree or array.

**_Why array based representation for Binary Heap?_**

  Since a Binary Heap is a Complete Binary Tree, it can be easily represented as an array and the array-based representation is space-efficient. 

**_How we sort using Heap Sort?_**
  1. Build a max heap from the input data. 
  2. At this point, the largest item is stored at the root of the heap. Replace it with the last item of the heap followed by reducing the size of heap by 1. Finally, heapify the root of the tree. 
  3. Repeat step 2 while the size of the heap is greater than 1.

