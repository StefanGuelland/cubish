//
// Created by sguelland on 29.01.18.
//

#ifndef CUBISH_WENN_H
#define CUBISH_WENN_H


#include <ParseTreeNode_Interface.h>
#include <ParseTreeNodeBool_Interface.h>

namespace ParseTree {

    class Wenn  : public  ParseTreeNode_Interface {

    private:
        ParseTreeNodeBool_Interface* bool_expression;
        ParseTreeNode_Interface* wahr_nodes;
        ParseTreeNode_Interface* falsch_nodes;

    public:
        Wenn( ParseTreeNodeBool_Interface* bool_expression_,
              ParseTreeNode_Interface* wahr_nodes_,
              ParseTreeNode_Interface* falsch_nodes_
        );
        void Execute(void) override ;
    };

}


#endif //CUBISH_WENN_H
