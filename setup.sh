#!/bin/bash

# Make a bin dir in home directory
echo "Making a directory at $HOME/bin"
mkdir $HOME/bin

# Download the source codes
echo "Downloading the source code"
wget https://raw.githubusercontent.com/lukashh6/makefile-generator/master/generator.py
chmod +x generator.py

# Linking to the bin dir
echo "Linking to $HOME/bin/generate"
ln -s generator.py $HOME/bin/generate

echo "Exporting PATH"
echo "export PATH=\$PATH:$HOME/bin" >> $HOME/.bash_profile

echo "Done!"
echo
echo "Now, try to use the command, generate [name]. Ex: generate lab7"
