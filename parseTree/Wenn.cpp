//
// Created by sguelland on 29.01.18.
//

#include "Wenn.h"

void ParseTree::Wenn::Execute(void) {
    if(bool_expression->ExecuteBool())
        wahr_nodes->Execute();
    else
        if(falsch_nodes != nullptr)
            falsch_nodes->Execute();
}

ParseTree::Wenn::Wenn(
    ParseTreeNodeBool_Interface* bool_expression_,
    ParseTreeNode_Interface* wahr_nodes_,
    ParseTreeNode_Interface* falsch_nodes_
){
    bool_expression = bool_expression_;
    wahr_nodes = wahr_nodes_;
    falsch_nodes = falsch_nodes_;
}