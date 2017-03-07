#!/bin/bash

INST_PATH="$HOME/makefile-generator"

# Make a dir for the program
echo "Making a new directory at $INST_PATH"
mkdir $INST_PATH
cd $INST_PATH

# Download the source codes
echo "Downloading the source code"
wget https://raw.githubusercontent.com/lukashh6/makefile-generator/master/generator.py
chmod +x $INST_PATH/generator.py

# Make a bin dir in home directory
echo "Making a directory at $HOME/bin"
mkdir $HOME/bin

# Linking to the bin dir
echo "Linking to $HOME/bin/generate"
ln -s $INST_PATH/generator.py $HOME/bin/generate

echo "Exporting PATH"
echo "export PATH=\$PATH:$HOME/bin" >> $HOME/.bash_profile

# Refresh bash profile
source $HOME/.bash_profile

echo "Done!"
echo
echo "Now, try to use the command, generate [name]. Ex: generate lab7"
