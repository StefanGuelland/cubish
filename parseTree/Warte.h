//
// Created by sguelland on 18.01.18.
//

#ifndef CUBISH_WARTEN_H
#define CUBISH_WARTEN_H

#include <ParseTreeNode_Interface.h>

namespace ParseTree {

    class Warte : public ParseTreeNode_Interface  {

    private:
        int zeit;

    public:
        Warte(int zeit_);
        virtual void Execute(void);
    };
}

#endif //CUBISH_WARTEN_H
