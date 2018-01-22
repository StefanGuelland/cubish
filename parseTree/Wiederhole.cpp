//
// Created by sguelland on 18.01.18.
//

#include "Wiederhole.h"

void ParseTree::Wiederhole::Execute(void) {
    while(true) {
        inner_nodes->Execute();
    }
}

ParseTree::Wiederhole::Wiederhole(
        ParseTreeNode_Interface *inner_nodes_,
        ParseTreeNode_Interface *bool_expression_) {
    inner_nodes = inner_nodes_;
    bool_expression = bool_expression_;

}
