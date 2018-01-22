//
// Created by sguelland on 22.01.18.
//

#ifndef CUBISH_INTEGER_H
#define CUBISH_INTEGER_H

#include <ParseTreeNodeInt_Interface.h>

namespace ParseTree {

    class Integer : public ParseTreeNodeInt_Interface{
    public:
        Integer(int value_);
        virtual int ExecuteInt(void);

    private:
        int value;
    };

}

#endif //CUBISH_INTEGER_H
