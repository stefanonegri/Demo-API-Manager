# Demo-API-Manager
demo of APIM with consumer and developer view

Prerequisites:

Install WSO2 API Manager 3.0.0 and enable analytics;

Install WSO2 API Manager Analytics 3.0.0;

Install WSO2 API Manager APICtl;


Pre tasks:

1) Create the following roles:
  WritePermission, ReadPermission (no permissions, only for scopes)
2) Create the following users:
  consumer (roles: Internal/subscriber); developer (roles: Internal/subscriber, Internal/creator, Internal/publisher); user (ReadPermission)
3)Add custom throttling policies:
  a. Application Policy: 10 per Min; 
  b. Subscription Policy (Guest: 5 per min.)
4) Import Countries API (Countries_1.0.0.zip)

