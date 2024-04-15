#!/bin/bash

for d in */ ; do
    echo "Stowing $d..."
    stow -v -R -t ~ $d
done
