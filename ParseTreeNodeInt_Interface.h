//
// Created by sguelland on 18.01.18.
//

#ifndef CUBISH_PARSETREENODEINT_INTERFACE_H
#define CUBISH_PARSETREENODEINT_INTERFACE_H


#include "ParseTreeNode_Interface.h"

class ParseTreeNodeInt_Interface : public ParseTreeNode_Interface {
public:
    virtual int ExecuteInt() { return 0;};
};


#endif //CUBISH_PARSETREENODEINT_INTERFACE_H
