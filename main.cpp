#include <iostream>
#include <fstream>
#include <map>
#include <string>
#include "functions.h"

int main(){

    std::map<std::string,int> wordCount;

    std::ifstream in("tekstas.txt");
    if (!in) {
        std::cerr << "Nepavyko atidaryti failo tekstas.txt\n";
        return 1;
    }

    std::string line;
    while (std::getline(in, line)) {
        std::string token;
            for (char c : line) {
                if (isDelimiter(c)) {
                    if (!token.empty()) {
                        wordCount[toLower(token)]++;
                        token.clear();
                    }
                } else {
                    token += c;
                }
            }
                if (!token.empty()) {
                    wordCount[toLower(token)]++;
                }
    }

    return 0;
}