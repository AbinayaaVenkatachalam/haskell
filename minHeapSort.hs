--Main function
main :: IO ()
main = do
    putStrLn ( "Unsorted: " ++ show listToSort)
    putStrLn ("Sorted: " ++ show (heapSort listToSort))

--Input
listToSort :: [Integer]
listToSort = [13, 15, 8, 7, 234, 124, 56, 11, 18, 19, 6, 20]

-- Sort the input list with the heap sort algorithm
heapSort :: (Ord a) => [a] -> [a]
heapSort [] = []
heapSort [x] = [x]
heapSort xs = heapSort' (minHeap xs) []

-- Recursive helper function for heapSort
heapSort' :: Ord a => [a] -> [a] -> [a]
heapSort' [] out = out
heapSort' h out = heapSort' (extract h) out ++ [head h]

-- Construct a min heap (as a list) from a given input list
minHeap :: Ord a => [a] -> [a]
minHeap [] = []
minHeap [x] = [x]
minHeap xs = minHeap' xs (div (length xs) 2)

-- Recursive helper function for maxHeap
minHeap' :: Ord a => [a] -> Int -> [a]
minHeap' xs 0 = minHeapify xs 0
minHeap' xs i = minHeap' (minHeapify xs i) (i-1)

-- Given a heap and an index (i), move the element at i down the heap until it is in the right position
minHeapify :: (Ord a) => [a] -> Int -> [a]
minHeapify xs i | not (hasAnyChild xs i) = xs
                | hasLeftChild xs i && hasRightChild xs i =
                    let largestChild = if xs !! (leftChild i) < xs !! (rightChild i) then leftChild i else rightChild i
                    in if xs !! largestChild < xs !! i then minHeapify (swap xs largestChild i) largestChild else xs
                | hasLeftChild xs i =
                    if xs !! (leftChild i) < xs !! i then minHeapify (swap xs (leftChild i) i) (leftChild i) else xs
                | otherwise =
                    if xs !! (rightChild i) < xs !! i then minHeapify (swap xs (rightChild i) i) (rightChild i) else xs


-- Fix the heap after removing the smallest element from the heap
extract :: Ord a => [a] -> [a]
extract [] = []
extract [_] = []
extract xs = minHeapify ((last xs):take (length xs - 2) (tail xs)) 0


-- Swap the values stored in two positions in a list
swap :: [a] -> Int -> Int -> [a]
swap xs i1 i2 = map snd . foldr (\x a ->
        if fst x == i1 then ys !! i2 : a
        else if fst x == i2 then ys !! i1 : a
        else x : a) [] $ ys
    where ys = zip [0..] xs

-- Index where the left child of the node at the given index should be located
leftChild :: Int -> Int
leftChild i = 2 * i + 1

-- Index where the right child of the node at the given index should be located
rightChild :: Int -> Int
rightChild i = 2 * i + 2

-- Helper functions to determine if any child nodes are present in the heap for the node at a given index
hasLeftChild, hasRightChild, hasAnyChild :: [a] -> Int -> Bool
hasLeftChild xs i = leftChild i < length xs

hasRightChild xs i = rightChild i < length xs

hasAnyChild xs i = hasLeftChild xs i || hasRightChild xs i
