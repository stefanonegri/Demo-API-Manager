export TOKEN_EP=https://localhost:9443/oauth2/token

export AUTHZ_EP=https://localhost:9443/oauth2/authorize

export INTROSPECT_EP=https://localhost:9443/oauth2/introspect

export REVOKE_EP=https://localhost:9443/oauth2/revoke

export PDP_SERVER_URL=https://localhost:9443/api/identity/entitlement/decision/pdp

# client id
export CLIENTID=DxwyWS_bnL0V3FxuggOOKwvryVEa

# client secret
export CLIENTSECRET=e1uUexQ0i_TAEDCmuvfaheGL1f0a

# the username used for both resource owner password grant type and to authenticate to the XACML PDP
export USERNAME=admin

# the password used for both resource owner password grant type and to authenticate to the XACML PDP
export PASSWORD=admin

# the scope used in requesting an access token
export SCOPE=openid

# the oauth 2.0 redirect_uri used in authorization code and implicit grant types.
export REDIRECTURI=http://127.0.0.1:5000/


# this is the business api endpoint, hosted in wso2 api manager.
export API_EP=https://localhost:8245/bc/v1.0.0/latestblock
