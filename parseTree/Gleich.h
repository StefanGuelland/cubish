//
// Created by sguelland on 18.01.18.
//

#ifndef CUBISH_GLEICH_H
#define CUBISH_GLEICH_H

#include <ParseTreeNodeBool_Interface.h>
#include <ParseTreeNode_Interface.h>

namespace ParseTree {

    class Gleich : public ParseTreeNodeBool_Interface{

    private:
        ParseTreeNode_Interface* node1;
        ParseTreeNode_Interface* node2;

    public:
        Gleich(ParseTreeNode_Interface* node1_, ParseTreeNode_Interface* node2_);

        virtual bool ExecuteBool(void);
    };

}


#endif //CUBISH_GLEICH_H
