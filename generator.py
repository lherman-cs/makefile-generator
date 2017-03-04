#!/usr/bin/python3

import os
from os.path import splitext
from argparse import ArgumentParser


def generate(name='a.out'):
    # Get all the files in the dir without the extensions
    sources = [splitext(source)[0] + '.o' for source in os.listdir() \
                if source.endswith('.c') or source.endswith('.cpp')]

    script =    'CC = g++\n' + \
                'CFLAGS = -Wall -c\n' + \
                'OBJS = ' + ' '.join(sources) + '\n\n' + \
                name + ': ${OBJS}\n' + \
                        '\t@echo\n' + \
                        '\t@echo Linking $@\n' + \
                        '\t${CC} -o $@ ${OBJS}\n\n' + \
                '%.o: %.cpp\n' + \
                        '\t@echo\n' + \
                        '\t@echo Compiling $<\n' + \
                        '\t${CC} ${CFLAGS} $< 2> $*.err\n' + \
                        '\t@cat $*.err\n\n' + \
                'clean:\n' + \
                        '\t@echo Remove:\n' + \
                        '\t@ls | grep -E ".*\.(o|err)"\n' + \
                        '\t@rm -f *.err *.o\n'

    with open('Makefile', 'w') as makefile:
        makefile.write(script)

    print("Makefile has been successfully created!")

def main():
    parser = ArgumentParser()
    parser.add_argument('name', default='a.out', type=str)
    args = parser.parse_args()

    generate(args.name)

if __name__ == '__main__':
    main()
