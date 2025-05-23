#include "functions.h"
#include <cctype>

bool isDelimiter(char c) {
    return !std::isalnum(static_cast<unsigned char>(c));
}

std::string toLower(const std::string &s) {
    std::string out;
    for (char c : s) {
        out += static_cast<char>(std::tolower(static_cast<unsigned char>(c)));
    }
    return out;
}