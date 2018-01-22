//
// Created by sguelland on 18.01.18.
//

#ifndef CUBISH_FAERBEAUF_H
#define CUBISH_FAERBEAUF_H

#include <ParseTreeNode_Interface.h>
#include <string>

namespace ParseTree {

class FaerbeAuf : public ParseTreeNode_Interface {

private:
    std::string variable;
    int r;
    int g;
    int b;

public:
    FaerbeAuf(const char* variable, int r, int g, int b);
    virtual void Execute(void);
};

}


#endif //CUBISH_FAERBEAUF_H
