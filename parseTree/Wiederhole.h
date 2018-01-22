//
// Created by sguelland on 18.01.18.
//

#ifndef CUBISH_WIEDERHOLE_H
#define CUBISH_WIEDERHOLE_H

#include <ParseTreeNode_Interface.h>
#include <ParseTreeNodeBool_Interface.h>

namespace ParseTree {

    class Wiederhole  : public  ParseTreeNode_Interface {

    private:
        ParseTreeNode_Interface* inner_nodes;
        ParseTreeNodeBool_Interface* bool_expression;

    public:
        Wiederhole(ParseTreeNode_Interface* inner_nodes_, ParseTreeNodeBool_Interface* bool_expression_);
        virtual void Execute(void);
    };

}

#endif //CUBISH_WIEDERHOLE_H
