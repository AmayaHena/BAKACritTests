#!/bin/bash

# cleaning
rm a.out
rm main

# compilation binary
cd binary && ghc main.hs &&
rm *.hi && rm *.o
mv main ..
cd ..

# compilation criterion test
cd criterionTest && g++ -lcriterion test.cpp && mv a.out ..
