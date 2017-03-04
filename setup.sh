#!/bin/bash

# Make a bin dir in home directory
echo "Making a directory at $HOME/bin"
mkdir $HOME/bin

echo "Exporting PATH"
echo "export PATH=\$PATH:$HOME/bin" >> $HOME/.bash_profile

echo "Done!"
echo
echo "Now, try to use the command, generate [name]. Ex: generate lab7"
