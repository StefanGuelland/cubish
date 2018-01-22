//
// Created by sguelland on 22.01.18.
//

#ifndef CUBISH_GROESSER_H
#define CUBISH_GROESSER_H
#include <ParseTreeNodeBool_Interface.h>
#include <ParseTreeNodeInt_Interface.h>

namespace ParseTree {


    class Groesser : public ParseTreeNodeBool_Interface {

    private:
        ParseTreeNodeInt_Interface* node1;
        ParseTreeNodeInt_Interface* node2;

    public:
        Groesser(ParseTreeNodeInt_Interface* node1_, ParseTreeNodeInt_Interface* node2_);

        virtual bool ExecuteBool(void);
    };

}


#endif //CUBISH_GROESSER_H
