original source:
https://github.com/meyerd/flex-bison-example

Like the original source, this must be under GPLv3!

Graph generation:
bison -d -o cmake-build-debug/parser.cpp --graph parser.y
dot -Tpng cmake-build-debug/parser.dot > cmake-build-debug/parser.png
