#!/bin/bash

play () {
    start=1
    end=1000

    echo "Welcome to our guessing game"
    echo "Please think of a number"
    echo "between $start and $end"
    echo "And I will try to guess it"
    echo "You have 10 seconds to think"

    for i in {10..1..-1}
    do
        echo -ne " $i\033[0K\r"
        sleep 1s
    done

    get_response () {
        echo
        echo "Is it $guess ?"
        echo "Type 't' if my guess is true"
        echo "Type 'l' if the answer is less than my guess"
        echo "Type 'g' if the answer is greater than my guess"
        read response
    }

    while true;
    do
        ((guess=(start+end)/2))
        get_response
        case $response in
            "l" | "L" )
                ((end=guess-1))
                ;;
            "g" | "G" )
                ((start=guess+1))
                ;;
            "t" | "T" )
                echo "I DID IT !!!!!!"
                break
                ;;
            * )
                echo "Invalid Response, Only ('t', 'l', 'g' allowed)"
                continue
                ;;
        esac
    done

    read -p "Play Again? (Y/n)" again
    if [ $again == "Y" ];
    then
        play
    fi
}

play