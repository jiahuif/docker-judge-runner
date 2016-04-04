#!/bin/bash

function run_judge {

    echo running with java runner
    touch build/stderr.txt
    touch build/stdout.txt

    # run with docker
    docker run --rm -v `pwd`/build/target:/target:ro -v `pwd`/build/input.txt:/tmp/stdin.txt -v `pwd`/build/stdout.txt:/tmp/stdout.txt -v `pwd`/build/stderr.txt:/tmp/stderr.txt judge-runner-java || exit 1

    # compare with diff
    diff build/answer.txt build/stdout.txt || exit 2

    # show content in stderr should there be any
    cat build/stderr.txt

    # clean up
    rm -rf build/
}

mkdir -p build/target
javac aplusb/Main.java -d build/target
echo 1 2 > build/input.txt
echo 3 > build/answer.txt

run_judge

mkdir -p build/target
javac large_array/Main.java -d build/target
touch build/input.txt
touch build/answer.txt

run_judge

mkdir -p build/target
javac exception/Main.java -d build/target
touch build/input.txt
touch build/answer.txt

run_judge


