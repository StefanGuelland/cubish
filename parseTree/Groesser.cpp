//
// Created by sguelland on 22.01.18.
//

#include "Groesser.h"

ParseTree::Groesser::Groesser(ParseTreeNodeInt_Interface *node1_, ParseTreeNodeInt_Interface *node2_) {
    node1 = node1_;
    node2 = node2_;
}

bool ParseTree::Groesser::ExecuteBool(void) {
    return node1->ExecuteInt() > node2->ExecuteInt();
}
