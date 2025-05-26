#ifndef FUNCTIONS_H
#define FUNCTIONS_H

#include <string>
#include <map>
#include <set>

bool isDelimiter(char c);
std::string toLower(const std::string &s);
void crossReference(const std::string &filename, const std::map<std::string,int> &wordCount, std::map<std::string,std::set<int>> &wordLines);
void findURLs(const std::string &filename, std::set<std::string> &urls);

                   
#endif
