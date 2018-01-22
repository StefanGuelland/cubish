//
// Created by sguelland on 18.01.18.
//

#include "Gleich.h"

ParseTree::Gleich::Gleich(ParseTreeNodeInt_Interface *node1_, ParseTreeNodeInt_Interface *node2_) {
    node1 = node1_;
    node2 = node2_;
}

bool ParseTree::Gleich::ExecuteBool(void) {
    return node1->ExecuteInt() == node2->ExecuteInt();
}
