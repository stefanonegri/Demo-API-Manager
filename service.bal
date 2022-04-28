import ballerinax/covid19;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    resource function get stats/[string country]() returns json|error {

        covid19:Client covid19Endpoint = check new ({});
        covid19:CovidCountry satusByCountry = check covid19Endpoint->getStatusByCountry(country);
        int totalCases = <int>satusByCountry.cases;
        json payload = {country: country, totalCases: totalCases};
        return payload;
    }
}
