//
// Created by sguelland on 22.01.18.
//

#ifndef CUBISH_SETZEINTEGERIDENTIFIER_H
#define CUBISH_SETZEINTEGERIDENTIFIER_H

#include <ParseTreeNodeInt_Interface.h>
#include "IntegerIdentifier.h"

namespace ParseTree {

    class SetzeIntegerIdentifier : public ParseTreeNode_Interface  {

    public:
        SetzeIntegerIdentifier(const char* identifier_,  ParseTreeNodeInt_Interface* node_);
        void Execute(void);

    private:
        ParseTree::IntegerIdentifier identNode;
        ParseTreeNodeInt_Interface* node;
    };

}


#endif //CUBISH_SETZEINTEGERIDENTIFIER_H
