#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include "../third_party/doctest.h"
#include "../functions.h"

TEST_CASE("isDelimiter()") {
    CHECK( isDelimiter(' ') );
    CHECK( isDelimiter(',') );
    CHECK( isDelimiter('\n') );
    CHECK_FALSE( isDelimiter('a') );
    CHECK_FALSE( isDelimiter('Z') );
    CHECK_FALSE( isDelimiter('0') );
}

TEST_CASE("toLower()") {
    std::string s1 = "Hello, WORLD!123";
    std::string s2 = toLower(s1);
    CHECK( s2 == "hello, world!123" );
    CHECK( toLower("") == "" );
    CHECK( toLower("ABCdef") == "abcdef" );
}
