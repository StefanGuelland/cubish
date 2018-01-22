//
// Created by sguelland on 18.01.18.
//

#ifndef CUBISH_PARSERTREENODEBOOL_INTERFACE_H
#define CUBISH_PARSERTREENODEBOOL_INTERFACE_H


#include "ParseTreeNode_Interface.h"

class ParseTreeNodeBool_Interface : public ParseTreeNode_Interface {
public:
    virtual bool ExecuteBool() { return true;};
};


#endif //CUBISH_PARSERTREENODEBOOL_INTERFACE_H
