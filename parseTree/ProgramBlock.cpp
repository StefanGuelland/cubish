//
// Created by sguelland on 18.01.18.
//

#include <iostream>
#include "ProgramBlock.h"

ParseTree::ProgramBlock::ProgramBlock(ParseTreeNode_Interface *node1_, ParseTreeNode_Interface *node2_) {
    node1 = node1_;
    node2 = node2_;
}

void ParseTree::ProgramBlock::Execute(void) {
//    std::cout << "\tProgramBlock " << std::endl;
    if(node1 != NULL)
        node1->Execute();
    if(node2 != NULL)
        node2->Execute();
}
