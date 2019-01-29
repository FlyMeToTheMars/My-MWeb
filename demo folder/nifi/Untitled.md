```
# Site to Site properties
nifi.remote.input.host=machine001
nifi.remote.input.secure=true
nifi.remote.input.socket.port=9997
nifi.remote.input.http.enabled=true
nifi.remote.input.http.transaction.ttl=30 sec
nifi.remote.contents.cache.expiration=30 secs

# web properties #
nifi.web.war.directory=./lib
nifi.web.http.host=
#nifi.web.http.host=machine002
#nifi.web.http.host=machine003
nifi.web.http.port=
nifi.web.http.network.interface.default=
nifi.web.https.host=machine001
nifi.web.https.port=9443
nifi.web.https.network.interface.default=
nifi.web.jetty.working.directory=./work/jetty
nifi.web.jetty.threads=200
nifi.web.max.header.size=16 KB
nifi.web.proxy.context.path=
nifi.web.proxy.host=

# security properties #
nifi.sensitive.props.key=
nifi.sensitive.props.key.protected=
nifi.sensitive.props.algorithm=PBEWITHMD5AND256BITAES-CBC-OPENSSL
nifi.sensitive.props.provider=BC
nifi.sensitive.props.additional.keys=

nifi.security.keystore=/opt/nifi-1.6.0/conf/keystore.jks
nifi.security.keystoreType=jks
nifi.security.keystorePasswd=68Hm1lfA1QAX2q3xK+CM+PYTqby5hXeIWDra+ReBQwM
nifi.security.keyPasswd=68Hm1lfA1QAX2q3xK+CM+PYTqby5hXeIWDra+ReBQwM
nifi.security.truststore=/opt/nifi-1.6.0/conf/truststore.jks
nifi.security.truststoreType=jks
nifi.security.truststorePasswd=r9gZJ6/v0ro3SyWeQ7AdD0bYu4Y7vPjL2A8UkRoIODQ
nifi.security.needClientAuth=true
nifi.security.user.authorizer=managed-authorizer
nifi.security.user.login.identity.provider=
nifi.security.ocsp.responder.url=
nifi.security.ocsp.responder.certificate=

# cluster common properties (all nodes must have same values) #
nifi.cluster.protocol.heartbeat.interval=5 sec
nifi.cluster.protocol.is.secure=true

```

