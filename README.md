# Demo-API-Manager
demo of APIM with consumer and developer view

## Prerequisites:

Install WSO2 API Manager 4.4.0
Configure Choreo Analytics (see https://apim.docs.wso2.com/en/4.4.0/api-analytics/choreo-analytics/getting-started-guide/#!)

Install WSO2 API Manager APICtl;


## Pre tasks:

### Enable Choreo Analytics
### Configure open telemetry
#### Download Jaeger
Download it from here: https://www.jaegertracing.io/download/#binaries ( tested version 1.62)
#### Run Jaeger
Run the command: ./jaeger-all-in-one  
Check that it is up an running accessing http://localhost:16686
#### Configure APIM
see the documentation here: https://apim.docs.wso2.com/en/latest/observe/api-manager/traces/monitoring-with-opentelemetry/
### Create the following roles:
  WritePermission, ReadPermission (no permissions, only for scopes)
### Create the following users:
  consumer (roles: Internal/subscriber); developer (roles: Internal/subscriber, Internal/creator, Internal/publisher); user (ReadPermission)
### Add custom throttling policies:
  a - Application Policy: 10 per Min;  
  b - Subscription P./ap  olicy (Guest: 5 per min.)
### Import Countries API (Countries_1.0.0.zip) preserving the owner
Example: ./apictl import api -f CountryAPI/Country_1.0.zip -e demo  
Deploy the imported API
### Run Countries APIs several times (for Analytics purposes)
for example run the following command with a valid token: for ((i=1;i<=15;i++)); do sh CountryAPI.sh ; done

## Developer Experience

### Create new APIs
Design new API (show the country API just imported; show how to create a new one)

Existing API: (https://petstore.swagger.io/v2/swagger.json; EP: http://petstore.swagger.io/v2)

SOAP Endpoint: (http://ws.cdyne.com/phoneverify/phoneverify.asmx?wsdl; EP:http://ws.cdyne.com/phoneverify/phoneverify.asmx)

GraphQL: (download the schema from: https://api.graph.cool/simple/v1/swapi; EP: the same (TBC))

websocket: (TBC)

### Prototype (use the petstore APIs):
for the GET pet/{petid} resource implement the follwing:

mc.setProperty('CONTENT_TYPE', 'application/json');

var petId = mc.getProperty('uri.var.petId');

var myPayload = {"id": petId,"category":{"id":0,"name":"string"},"name":"doggie","photoUrls":["string"],"tags":[{"id":0,"name":"string"}],"status":"available"};

mc.setPayloadJSON(myPayload);

Deploy as prototype, go to the Dev Portal and try out

### Apply Policies (use the petstore APIs):

Show the following tabs/features:

TRANSPORT LEVEL SECURITY
  (to use it: add the certificate certificate.crt)

APPLICATION LEVEL SECURITY

CORS

SCHEMA VALIDATION

MESSAGE MEDIATION

CACHING

BACKEND THROUGHPUT

Resource -> Throttling

Documentation

## Consumer (and user) Experience

Show Dev Portal features: brownse APIs, try Petstore API, Create APP (OAuth token, Code enable, 10PerMin); generate keys, subscribe with Guest

callback url: http://127.0.0.1:5000/

Throttling: Throttling: for ((i=1;i<=15;i++)); do sh PetstoreAPI.sh ; done

Show Alerts

## Back to Developer Experience
Create API from command line (this sep can be also done upfront as part of the requisites or in the create API step above; use this commands: https://github.com/stefanonegri/Demo-API-Manager/blob/master/scripts/apictl

Show and try versioning
show API Products with Countries and Aviation APIs

## ADMIN Exerience

###  Analytics & Tracing
Login Choreo Analytics and show how Choreo Analytics provide statistic info on traffic, errors etc  
Login Jaeger @ localhost:16686, select API Gateway as a service and search: show how you can retrieve tracing info for each call
### Show APIM Admin
### Explain / show APICTL for devops activities
and REST APIS 

## Use an external Key Manager (Keycloak)
### Prerequisites
1. Download and install Keycloak (https://www.keycloak.org/downloads)
2. Run keycloack: [KCfolder]/bin ./kc.sh start-dev
3. Configue KC as reported here: https://apim.docs.wso2.com/en/latest/administer/key-managers/configure-keycloak-connector/
### Tasks
1. Go to the Developer Portal and create a new Application. Open the OAuth2 Tokens
2. Show that you can provide existing keys or create from the scretch
3. Create Keys
4. Create token
5. In order to create token with scopes (for example read:pets)  
   a. Go to the Keycloak console at http://localhost:8080  
   b. Go to Client Scope and create the scope read:pets (take the default values)  
   c. Enable the 'Include in token scope'  



