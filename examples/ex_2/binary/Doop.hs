--
-- PERSONAL PROJECT, 2020
-- FUN_day2_2019
-- File description:
-- DoOp
--

myElem :: Eq a => a -> [ a ] -> Bool
myElem x [] = False
myElem x (y:ys) = case (x == y) of
    True -> True
    False -> myElem x ys

safeDiv :: Int -> Int -> Maybe Int
safeDiv a 0 = Nothing
safeDiv a b = Just $ a `div` b

safeNth :: [ a ] -> Int -> Maybe a
safeNth (x:xs) 0 = Just $ head (x:xs)
safeNth (x:xs) index = case (index < 0) of
    False -> case (index >= length (x:xs)) of
        False -> safeNth xs (index - 1)
        True -> Nothing
    True -> Nothing
safeNth [] index = Nothing

safeSucc :: Maybe Int -> Maybe Int
safeSucc Nothing = Nothing
safeSucc (Just a) = Just $ a + 1

myLookup :: Eq a => a -> [( a , b ) ] -> Maybe b
myLookup a [] = Nothing
myLookup a (b:bs) = case (a == (fst b)) of
    True -> Just $ snd b
    False -> myLookup a bs

maybeDo :: ( a -> b -> c ) -> Maybe a -> Maybe b -> Maybe c
maybeDo func (Just a) Nothing = Nothing
maybeDo func Nothing (Just b) = Nothing
maybeDo func Nothing Nothing = Nothing
maybeDo func (Just a) (Just b) = Just $ func a b

charDigitOnly :: String -> Bool
charDigitOnly s = case reads s :: [(Integer, String)] of
    [(_, "")] -> True
    _         -> False

readInt :: [ Char ] -> Maybe Int
readInt [] = Nothing
readInt a = case (charDigitOnly a) of
    True -> Just $ read a
    False -> Nothing

getLineLength :: IO Int
getLineLength = do
   input <- getLine
   return $ length input

printAndGetLength :: String -> IO Int
printAndGetLength input = do
   putStrLn input
   return $ length input

printStraith :: Int -> Char -> [ Char ]
printStraith a c = case (a > 0) of
    True -> c : printStraith (a - 1) c
    False -> []

printHeigth :: Int -> Int -> IO ()
printHeigth len it = case (it > 0) of
    True -> do
        putStrLn ("|" ++ (printStraith ((len * 2) - 2) ' ') ++ "|")
        printHeigth len (it - 1)
        return ()
    False -> return ()

printBox :: Int -> IO ()
printBox 0 = return ()
printBox 1 = putStrLn "++"
printBox a = case (a < 0) of
    True -> return ()
    False -> do
        putStrLn  ("+" ++ (printStraith ((a * 2) - 2) '-') ++ "+")
        printHeigth a (a - 2)
        putStrLn  ("+" ++ (printStraith ((a * 2) - 2) '-') ++ "+")

concatLines :: Int -> IO String
concatLines a = case (a > 0) of
    True -> do
        input <- getLine
        line <- concatLines (a -  1)
        return (input ++ line)
    False -> return ""

getInt :: IO ( Maybe Int )
getInt = do
    input <- getLine
    return (readInt input)
