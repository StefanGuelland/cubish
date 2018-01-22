//
// Created by sguelland on 22.01.18.
//

#include "Geteilt.h"

ParseTree::Geteilt::Geteilt(ParseTreeNodeInt_Interface *node1_, ParseTreeNodeInt_Interface *node2_) {
    node1 = node1_;
    node2 = node2_;
}

int ParseTree::Geteilt::ExecuteInt(void) {
    return node1->ExecuteInt() / node2->ExecuteInt();
}
