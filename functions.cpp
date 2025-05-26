#include "functions.h"
#include <cctype>
#include <fstream>
#include <string>
#include <map>
#include <set>
#include <regex>

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

void crossReference(const std::string &filename, const std::map<std::string,int> &wordCount, std::map<std::string,std::set<int>> &wordLines){
    std::ifstream in(filename);
    if (!in) return;
    std::string line;
    int lineNumber = 0;

    while (std::getline(in, line)) {
        ++lineNumber;
        std::string token;

        for (char c : line) {
            if (isDelimiter(c)) {
                if (!token.empty()) {
                    std::string w = toLower(token);

                    if (wordCount.at(w) > 1) {
                        wordLines[w].insert(lineNumber);
                    }

                    token.clear();
                }
            } else {
                token += c;
            }
        }
        if (!token.empty()) {
            std::string w = toLower(token);

            if (wordCount.at(w) > 1) {
                wordLines[w].insert(lineNumber);
            }
        }
    }
}

void findURLs(const std::string &filename,
    std::set<std::string> &urls) {
    std::ifstream in(filename);
    if (!in) return;
    std::string line;
    std::regex urlRegex(R"((https?://)?(www\.)?[A-Za-z0-9\-]+\.[A-Za-z]{2,}(/[^\s]*)?)");
    while (std::getline(in, line)) {
        for (auto it = std::sregex_iterator(line.begin(), line.end(), urlRegex);
             it != std::sregex_iterator(); ++it) {
            urls.insert(it->str());
        }
    }
}