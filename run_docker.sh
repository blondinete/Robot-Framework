#!/bin/bash

print_help(){
    echo "============================================"
    echo "Robot Docker Wrapper"
    echo "============================================"
    echo "build               Builds the docker image"
    echo "run                 Runs the docker image"
    echo "run [suite name]    Runs the suit name"
    echo "help                Prints this message"
}

build_image(){
    echo "This program will build the docker image"
    docker build docker/. -t robot-framework:latest
}

run_suite() {
    suite_name=$1

    echo "The program will create a container in order to test the suite: $tag_name"
    docker run \
        --rm\
        --env ROBOT_OPTIONS="--include $tag_name" \
        -v $PWD/tests:/home/developer/robot-tests \
        --network host --name robot-framework-run robot-framework:latest bash --login run_tests.sh

}

run() {
    echo "The program will run docker the docker image"
    docker run \
        -it --rm\
        -v $PWD/tests:/home/developer/robot-tests \
        --network host --name robot-framework-run robot-framework:latest bash

}

user_input=$1


case $user_input in
build)
    build_image
    ;;
run)
    run
    ;;
suite)
    run_suite $2
    ;;
help)
    print_help
    ;;
esac
