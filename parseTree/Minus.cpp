//
// Created by sguelland on 22.01.18.
//

#include "Minus.h"

ParseTree::Minus::Minus(ParseTreeNodeInt_Interface *node1_, ParseTreeNodeInt_Interface *node2_) {
    node1 = node1_;
    node2 = node2_;
}

int ParseTree::Minus::ExecuteInt(void) {
    return node1->ExecuteInt() - node2->ExecuteInt();
}

