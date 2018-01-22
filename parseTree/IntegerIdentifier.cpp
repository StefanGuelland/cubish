//
// Created by sguelland on 22.01.18.
//

#include "IntegerIdentifier.h"

ParseTree::IntegerIdentifier::IntegerIdentifier(const char *identifier) {
    auto result = identifierMap.find(std::string(identifier));
    if(result != identifierMap.end())
        valuePtr = result->second;
    else{
        valuePtr = new int;
        identifierMap.insert(
                std::pair<const std::string, int *>
                        (std::string(identifier), valuePtr));
    }
}

int ParseTree::IntegerIdentifier::ExecuteInt(void) {
    return *valuePtr;
}

std::map<std::string, int*>  ParseTree::IntegerIdentifier::identifierMap = std::map<std::string, int*>();

void ParseTree::IntegerIdentifier::setInt(int value) {
    *valuePtr = value;
}
