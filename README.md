# Demo-API-Manager
demo of APIM with consumer and developer view

## Prerequisites:

Install WSO2 API Manager 3.0.0 and enable analytics;

Install WSO2 API Manager Analytics 3.0.0;

Install WSO2 API Manager APICtl;


## Pre tasks:

### Create the following roles:
  WritePermission, ReadPermission (no permissions, only for scopes)
### Create the following users:
  consumer (roles: Internal/subscriber); developer (roles: Internal/subscriber, Internal/creator, Internal/publisher); user (ReadPermission)
### Add custom throttling policies:
  a - Application Policy: 10 per Min; 
  b - Subscription Policy (Guest: 5 per min.)
### Import Countries API (Countries_1.0.0.zip)
Example: apictl import-api -f /Users/stefanonegri/Downloads/Countries_1.0.0.zip -e demo -k

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
  (to use it: add the certificate Add certificate certificate.crt)

APPLICATION LEVEL SECURITY

CORS

SCHEMA VALIDATION

MESSAGE MEDIATION

CACHING

BACKEND THROUGHPUT

Resource -> Throttling

Documentation
