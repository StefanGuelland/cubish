//
// Created by sguelland on 22.01.18.
//

#include "Integer.h"

ParseTree::Integer::Integer(int value_) {
    value = value_;
}

int ParseTree::Integer::ExecuteInt(void) {
    return value;
}
