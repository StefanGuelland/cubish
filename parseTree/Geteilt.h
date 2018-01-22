//
// Created by sguelland on 22.01.18.
//

#ifndef CUBISH_GETEILT_H
#define CUBISH_GETEILT_H


#include <ParseTreeNodeInt_Interface.h>

namespace ParseTree {

    class Geteilt : public ParseTreeNodeInt_Interface {
    public:
        Geteilt(ParseTreeNodeInt_Interface* node1_, ParseTreeNodeInt_Interface* node2_);
        virtual int ExecuteInt(void);

    private:
        ParseTreeNodeInt_Interface* node1;
        ParseTreeNodeInt_Interface* node2;
    };

}


#endif //CUBISH_GETEILT_H
