#!/bin/bash

function run_judge {
    echo running with static runner
    touch build/stderr.txt
    touch build/stdout.txt
    
    # run with docker
    docker run --rm --read-only --net none -v `pwd`/build/target:/target:ro -v `pwd`/build/input.txt:/tmp/stdin.txt -v `pwd`/build/stdout.txt:/tmp/stdout.txt -v `pwd`/build/stderr.txt:/tmp/stderr.txt indeedplusplus/judge-runner:static || exit 1

    # compare with diff
    diff build/answer.txt build/stdout.txt || exit 2

    # clean up
    rm -rf build/
}


# C++11 a + b
mkdir -p build/target
g++ -static -std=c++11 aplusb.cpp -o build/target/main || exit 1
echo 1 2 > build/input.txt
echo 3 > build/answer.txt

run_judge


# C a + b
mkdir -p build/target
gcc -static aplusb.c -o build/target/main || exit 1
echo 1 2 > build/input.txt
echo 3 > build/answer.txt

run_judge


# C++11 prime count with -O2
mkdir -p build/target
g++ -O2 -static -std=c++11 prime_count.cpp -o build/target/main || exit 1
echo 100000 > build/input.txt
echo 9592 > build/answer.txt

run_judge


# C++ memory waster
mkdir -p build/target
g++ -static -std=c++11 memory_waster.cpp -o build/target/main || exit 1
touch build/input.txt
touch build/answer.txt

run_judge


