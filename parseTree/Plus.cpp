//
// Created by sguelland on 22.01.18.
//

#include "Plus.h"


int ParseTree::Plus::ExecuteInt(void) {
    return node1->ExecuteInt() + node2->ExecuteInt();
}

ParseTree::Plus::Plus(ParseTreeNodeInt_Interface *node1_, ParseTreeNodeInt_Interface *node2_) {
    node1 = node1_;
    node2 = node2_;
}
