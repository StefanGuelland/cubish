//
// Created by sguelland on 22.01.18.
//

#include "SetzeIntegerIdentifier.h"

#include "IntegerIdentifier.h"

ParseTree::SetzeIntegerIdentifier::SetzeIntegerIdentifier(const char *identifier_, ParseTreeNodeInt_Interface *node_) :
        identNode(identifier_){
    node = node_;
}

void ParseTree::SetzeIntegerIdentifier::Execute(void) {
    identNode.setInt(node->ExecuteInt());
}

