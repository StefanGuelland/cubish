//
// Created by sguelland on 18.01.18.
//

#ifndef CUBISH_FAERBEUM_H
#define CUBISH_FAERBEUM_H

#include <ParseTreeNode_Interface.h>
#include <string>

namespace ParseTree {

class FaerbeUm : public ParseTreeNode_Interface {

private:
    std::string variable;
    int r;
    int g;
    int b;

public:
    FaerbeUm(const char* variable, int r, int g, int b);
    virtual void Execute(void);
};

}

#endif //CUBISH_FAERBEUM_H
