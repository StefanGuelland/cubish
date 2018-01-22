//
// Created by sguelland on 18.01.18.
//

#include "ParseTree.h"

ParseTree::ParseTree(Knotentyp typ_, ParseTree *knoten1)
{
    typ = typ_;
}

void ParseTree::Execute()
{
    switch (getTyp()) {
        case Program:
            printf("Program\n");
            knoten1->Execute();
            break;
        default:
            printf("default\n");
    }
}

ParseTree::Knotentyp ParseTree::getTyp() const {
    return typ;
}

ParseTree *ParseTree::getKnoten1() const {
    return knoten1;
}

void ParseTree::setKnoten1(ParseTree *knoten1) {
    ParseTree::knoten1 = knoten1;
}

ParseTree *ParseTree::getKnoten2() const {
    return knoten2;
}

void ParseTree::setKnoten2(ParseTree *knoten2) {
    ParseTree::knoten2 = knoten2;
}

ParseTree *ParseTree::getKnoten3() const {
    return knoten3;
}

void ParseTree::setKnoten3(ParseTree *knoten3) {
    ParseTree::knoten3 = knoten3;
}

int ParseTree::getNumber() const {
    return number;
}

void ParseTree::setNumber(int number) {
    ParseTree::number = number;
}

char *ParseTree::getStr() const {
    return str;
}

void ParseTree::setStr(char *str) {
    ParseTree::str = str;
}

bool ParseTree::isBoolean() const {
    return boolean;
}

void ParseTree::setBoolean(bool boolean) {
    ParseTree::boolean = boolean;
}

void *ParseTree::getIdref() const {
    return idref;
}

void ParseTree::setIdref(void *idref) {
    ParseTree::idref = idref;
}
