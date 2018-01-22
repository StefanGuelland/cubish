//
// Created by sguelland on 18.01.18.
//

#ifndef CUBISH_PARSETREE_H
#define CUBISH_PARSETREE_H


#include <string>
#include <unordered_map>

class ParseTree {
public:
    enum Knotentyp {
        Int,
        Farbe,
        Koordinate,

        Program,
        CmdErstelleZahl,
    };

public:
    Knotentyp getTyp() const;

    ParseTree *getKnoten1() const;
    void setKnoten1(ParseTree *knoten1);

    ParseTree *getKnoten2() const;
    void setKnoten2(ParseTree *knoten2);

    ParseTree *getKnoten3() const;
    void setKnoten3(ParseTree *knoten3);

    int getNumber() const;
    void setNumber(int number);

    char *getStr() const;
    void setStr(char *str);

    bool isBoolean() const;
    void setBoolean(bool boolean);

    void *getIdref() const;
    void setIdref(void *idref);


    ParseTree(Knotentyp typ_, ParseTree *knoten1_ = NULL);
    void Execute();

    class Symbol{
        int ival;
        const char* str_val;
        struct{
            uint8_t r;
            uint8_t g;
            uint8_t b;
        } farbe_val;
        struct{
            int x;
            int y;
            int z;
        } koordinate_val;

    };

    static std::unordered_map<std::string, Symbol>symboltabelle;


private:
    Knotentyp typ;

    ParseTree *knoten1;
    ParseTree *knoten2;
    ParseTree *knoten3;

    int number;
    char *str;
    bool boolean;
    void *idref;


};


#endif //CUBISH_PARSETREE_H
