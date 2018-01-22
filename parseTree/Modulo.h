//
// Created by sguelland on 22.01.18.
//

#ifndef CUBISH_MODULO_H
#define CUBISH_MODULO_H


#include <ParseTreeNodeInt_Interface.h>

namespace ParseTree {

    class Modulo : public ParseTreeNodeInt_Interface {
    public:
        Modulo(ParseTreeNodeInt_Interface* node1_, ParseTreeNodeInt_Interface* node2_);
        virtual int ExecuteInt(void);

    private:
        ParseTreeNodeInt_Interface* node1;
        ParseTreeNodeInt_Interface* node2;
    };

}


#endif //CUBISH_MODULO_H
