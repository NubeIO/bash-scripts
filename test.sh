#!/bin/bash

# Open file descriptor (fd) 3 for read/write on a text file.
exec 3<> poem.txt

    # Let's print some text to fd 3
    echo "Roses are red" >&3
    echo "Violets are blue" >&3
    echo "Poems are cute" >&3
    echo "And so are you" >&3

# Close fd 3
exec 3>&-
