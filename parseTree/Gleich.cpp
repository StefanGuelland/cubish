//
// Created by sguelland on 18.01.18.
//

#include "Gleich.h"

ParseTree::Gleich::Gleich(ParseTreeNode_Interface *node1_, ParseTreeNode_Interface *node2_) {
    node1 = node1_;
    node2 = node2_;
}

bool ParseTree::Gleich::ExecuteBool(void) {
    return true;
}
