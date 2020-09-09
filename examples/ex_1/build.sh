#!/bin/bash

# BINARY BEGIN

# cleaning
rm executable

# compilation
cd binary && ghc -Wall -Werror *.hs -o executable &&
rm *.hi && rm *.o
mv executable ..
cd ..

# BINARY END

# ---

# CRITERION BEGIN

# cleaning
rm a.out

# compilation criterion test
cd criterionTest
g++ -lcriterion *.cpp
mv a.out ..

# CRITERION END
