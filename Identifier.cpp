//
// Created by StefanGuelland on 15.01.18.
//

#include <set>
#include <algorithm>
#include <string>
#include "Identifier.h"

static std::set<std::string> stringMap;

const char* Identifier_add(const char * src, unsigned long len)
{
    auto string = std::string(src,len);
    std::transform(string.begin(), string.end(), string.begin(), ::tolower);
    auto result = stringMap.insert(string);
    return result.first->c_str();
}
