//
// Created by sguelland on 18.01.18.
//

#ifndef CUBISH_ERSTELLEZAHL_H
#define CUBISH_ERSTELLEZAHL_H

#include <ParseTreeNode_Interface.h>
#include <string>

namespace ParseTree {

    class ErstelleZahl : public ParseTreeNode_Interface {

    private:
        std::string variable;
    public:
        ErstelleZahl(std::string string_);
        ErstelleZahl(const char* string_ptr);
        virtual void Execute(void);

    };


}

#endif //CUBISH_ERSTELLEZAHL_H
