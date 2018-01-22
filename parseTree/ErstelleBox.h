//
// Created by sguelland on 18.01.18.
//

#ifndef CUBISH_ERSTELLEBOX_H
#define CUBISH_ERSTELLEBOX_H

#include <ParseTreeNode_Interface.h>
#include <string>

namespace ParseTree {

    class ErstelleBox : public ParseTreeNode_Interface {

    private:
        std::string variable;
        int x;
        int y;
        int z;

    public:
        ErstelleBox(const char* variable_, int x_, int y_, int z_);
        virtual void Execute(void);

    };

}

#endif //CUBISH_ERSTELLEBOX_H
