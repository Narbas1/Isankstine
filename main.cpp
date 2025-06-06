#include <iostream>
#include <fstream>
#include <map>
#include <string>
#include "functions.h"

int main(){

    const std::string filename = "tekstas.txt";
    std::map<std::string,int> wordCount;

    std::ifstream in("tekstas.txt");
    if (!in) {
        std::cerr << "failed to open file tekstas.txt\n";
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
                }
                else {
                    token += c;
                }
            }
                if (!token.empty()) {
                    wordCount[toLower(token)]++;
                }
    }

    std::map<std::string,std::set<int>> wordLines;
    crossReference(filename, wordCount, wordLines);

    std::set<std::string> urls;
    findURLs(filename, urls);

    std::ofstream outWords("zodziai.txt");
    outWords << "words that appeared more than 1 time:\n";
    for (const auto &p : wordCount) {
        if (p.second > 1)
            outWords << p.first << ": " << p.second << '\n';
    }
    std::ofstream outXref("xref.txt");
    outXref << "cross-reference (word: lines):\n";
    for (const auto &p : wordLines) {
        outXref << p.first << ": ";
        bool first = true;
        for (int ln : p.second) {
            if (!first) outXref << ", ";
            outXref << ln;
            first = false;
        }
        outXref << '\n';
    }

    std::ofstream outUrls("urls.txt");
    outUrls << "found URLs:\n";
    for (const auto &u : urls) {
        outUrls << u << '\n';
    }

    return 0;
}