#include <string>
#include <functional>
#include <map>

using namespace std;

class Request {
    function<map<string, string>(const map<string, string>&)> oper;
    map<string, string> values;
    map<string, string> results;
public:
    Request(const string& s){}

    void execute()
    {
        [=]() {results = oper(values);};
    }
};

int main() {
    Request r("test");
    r.execute();
}