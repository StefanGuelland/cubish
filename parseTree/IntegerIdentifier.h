//
// Created by sguelland on 22.01.18.
//

#ifndef CUBISH_INTEGERIDENTIFIER_H
#define CUBISH_INTEGERIDENTIFIER_H


#include "ParseTreeNodeInt_Interface.h"
#include <map>

namespace ParseTree {

    class IntegerIdentifier : public ParseTreeNodeInt_Interface {
    public:
        IntegerIdentifier(const char *identifier);

        virtual int ExecuteInt(void);
        void setInt(int value);

    private:
        int *valuePtr;
        static std::map<std::string, int*> identifierMap;
    };

}




#endif //CUBISH_INTEGERIDENTIFIER_H
