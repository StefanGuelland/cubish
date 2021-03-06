//
// Created by sguelland on 18.01.18.
//

#ifndef CUBISH_GLEICH_H
#define CUBISH_GLEICH_H

#include <ParseTreeNodeBool_Interface.h>
#include <ParseTreeNodeInt_Interface.h>

namespace ParseTree {

    class Gleich : public ParseTreeNodeBool_Interface{

    private:
        ParseTreeNodeInt_Interface* node1;
        ParseTreeNodeInt_Interface* node2;

    public:
        Gleich(ParseTreeNodeInt_Interface* node1_, ParseTreeNodeInt_Interface* node2_);

        virtual bool ExecuteBool(void);
    };

}


#endif //CUBISH_GLEICH_H
