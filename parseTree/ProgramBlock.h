//
// Created by sguelland on 18.01.18.
//

#ifndef CUBISH_PROGRAMBLOCK_H
#define CUBISH_PROGRAMBLOCK_H

#include <ParseTreeNode_Interface.h>
#include <string>

namespace ParseTree {

    class ProgramBlock : public ParseTreeNode_Interface {

    private:
        ParseTreeNode_Interface* node1;
        ParseTreeNode_Interface* node2;
    public:
        ProgramBlock(ParseTreeNode_Interface* node1_, ParseTreeNode_Interface* node2_);
        virtual void Execute(void);
    };

}

#endif //CUBISH_PROGRAMBLOCK_H
