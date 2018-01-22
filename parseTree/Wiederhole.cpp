//
// Created by sguelland on 18.01.18.
//

#include "Wiederhole.h"

void ParseTree::Wiederhole::Execute(void) {
    do {
        inner_nodes->Execute();
    } while(bool_expression->ExecuteBool());
}

ParseTree::Wiederhole::Wiederhole(
        ParseTreeNode_Interface *inner_nodes_,
        ParseTreeNodeBool_Interface *bool_expression_) {
    inner_nodes = inner_nodes_;
    bool_expression = bool_expression_;

}
