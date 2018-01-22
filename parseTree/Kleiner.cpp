//
// Created by sguelland on 22.01.18.
//

#include "Kleiner.h"

ParseTree::Kleiner::Kleiner(ParseTreeNodeInt_Interface *node1_, ParseTreeNodeInt_Interface *node2_) {
    node1 = node1_;
    node2 = node2_;
}

bool ParseTree::Kleiner::ExecuteBool(void) {
    return node1->ExecuteInt() < node2->ExecuteInt();
}
