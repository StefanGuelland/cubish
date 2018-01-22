//
// Created by sguelland on 18.01.18.
//

#ifndef CUBISH_ERSTELLEWUERFEL_H
#define CUBISH_ERSTELLEWUERFEL_H


#include <string>
#include <ParseTreeNode_Interface.h>

namespace ParseTree {


class ErstelleWuerfel : public ParseTreeNode_Interface {

private:
    std::string variable;
    int size;

public:
    ErstelleWuerfel(const char* variable_, int size_);
    virtual void Execute(void);
};

}


#endif //CUBISH_ERSTELLEWUERFEL_H
