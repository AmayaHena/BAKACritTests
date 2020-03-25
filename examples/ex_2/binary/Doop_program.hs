--
-- PERSONAL PROJECT, 2020
-- FUN_day2_2019
-- File description:
-- doop_program
--

import System.Exit
import System.Environment

charDigitOnly :: String -> Bool
charDigitOnly s = case reads s :: [(Integer, String)] of
    [(_, "")] -> True
    _         -> False

readInt :: [ Char ] -> Int
readInt [] = 0
readInt a = case (charDigitOnly a) of
    True -> read a
    False -> 0

readIntB :: [ Char ] -> Bool
readIntB [] = False
readIntB a = case (charDigitOnly a) of
    True -> True
    False -> False

doopAdd :: Int -> Int -> Int
doopAdd a b = a + b

doopSub :: Int -> Int -> Int
doopSub a b = a - b

doopMul :: Int -> Int -> Int
doopMul a b = a * b

doopDiv :: Int -> Int -> Int
doopDiv a b = a `div` b

doopMod :: Int -> Int -> Int
doopMod a b = a `mod` b

main = do
    args <- getArgs

    let a = args !! 0
    let op = args !! 1
    let b = args !! 2

    case ((length args) == 3) of
        False -> exitWith (ExitFailure 84)
        True -> case (readIntB a) of
            False -> exitWith (ExitFailure 84)
            True -> case (readIntB b) of
                False -> exitWith (ExitFailure 84)
                True -> case (((b == "0") || (b == "-0")) && ((op == "/") || (op == "%"))) of
                    True -> exitWith (ExitFailure 84)
                    False -> case (op == "+") of
                        True -> print $ doopAdd (readInt a) (readInt b)
                        False -> case (op == "-") of
                            True -> print $ doopSub (readInt a) (readInt b)
                            False ->case (op == "/") of
                                True -> print $ doopDiv (readInt a) (readInt b)
                                False -> case (op == "*") of
                                    True -> print $ doopMul (readInt a) (readInt b)
                                    False -> case (op == "%") of
                                        True -> print $ doopMod (readInt a) (readInt b)
                                        False -> exitWith (ExitFailure 84)
