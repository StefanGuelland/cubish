//
// Created by sguelland on 18.01.18.
//

#ifndef CUBISH_ANZEIGEN_H
#define CUBISH_ANZEIGEN_H

#include <ParseTreeNode_Interface.h>

namespace ParseTree {

    class Anzeigen : public ParseTreeNode_Interface{

    public:
        Anzeigen();
        virtual void Execute(void);
    };

}


#endif //CUBISH_ANZEIGEN_H
