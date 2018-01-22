//
// Created by sguelland on 18.01.18.
//

#ifndef CUBISH_VERSCHIEBEUM_H
#define CUBISH_VERSCHIEBEUM_H

#include <ParseTreeNode_Interface.h>
#include <string>

namespace ParseTree {

    class VerschiebeUm : public  ParseTreeNode_Interface {

    private:
        std::string variable;
        int x;
        int y;
        int z;

    public:
        VerschiebeUm(const char* variable, int x, int y, int z);
        virtual void Execute(void);
    };

}

#endif //CUBISH_VERSCHIEBEUM_H
