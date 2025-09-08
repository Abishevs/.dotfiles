#!/usr/bin/env zsh
# ~/.config/pact/python.zsh

python_default() {
    # Will run if no aditional idetnifier is passed, so make it thin or
    # whatever
    echo "Python default scaffolding"
    touch main.py
}

python_lib() {
    echo "Python library scaffolding"
}

python_bin() {
    echo "Python binary scaffolding"
}

