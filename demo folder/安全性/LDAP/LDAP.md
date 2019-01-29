## 获取镜像

### Docker Hub

[osixia/openldap](osixia/openldap)

[osixia/phpldapadmin](osixia/phpldapadmin)

```shell
docker pull osixia/openldap

docker pull osixia/phpldapadmin
```


## Github

[openldap](osixia/openldap)

[phpLDAPadmin](https://github.com/osixia/docker-phpLDAPadmin)

### openldap

#### Quick Start

Run OpenLDAP docker image:

```
docker run --name my-openldap-container --detach osixia/openldap:1.2.2
```

Do not forget to add the port mapping for both port 389 and 689 if you wish to access the ldap server from another machine.

```
docker run -p 389:389 -p 689:689 --name my-openldap-container --detach osixia/openldap:1.2.2
```

Either command starts a new container with OpenLDAP running inside. Let's make the first search in our LDAP container:

```
docker exec my-openldap-container ldapsearch -x -H ldap://localhost -b dc=example,dc=org -D "cn=admin,dc=example,dc=org" -w admin
```



### phpLDAPadmin

#### Quick start

Run a phpLDAPadmin docker image by replacing `ldap.example.com` with your ldap host or IP :

```
docker run -p 6443:443 \
        --env PHPLDAPADMIN_LDAP_HOSTS=ldap.example.com \
        --detach osixia/phpldapadmin:0.7.2
```

That's it :) you can access phpLDAPadmin on [https://localhost:6443](https://localhost:6443/)

OpenLDAP & phpLDAPadmin in 1 Example script:

```
#!/bin/bash -e
docker run --name ldap-service --hostname ldap-service --detach osixia/openldap:1.1.8
docker run --name phpldapadmin-service --hostname phpldapadmin-service --link ldap-service:ldap-host --env PHPLDAPADMIN_LDAP_HOSTS=ldap-host --detach osixia/phpldapadmin:0.7.2

PHPLDAP_IP=$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" phpldapadmin-service)

echo "Go to: https://$PHPLDAP_IP"
echo "Login DN: cn=admin,dc=example,dc=org"
echo "Password: admin"
```



## 脚本：

```shell
#!/bin/bash -e
docker run --name ldap-service -p 389:389 -p 689:689 --hostname ldap-service --detach osixia/openldap
docker run --name phpldapadmin-service -p 6443:443  --hostname phpldapadmin-service --link ldap-service:ldap-host --env PHPLDAPADMIN_LDAP_HOSTS=ldap-host --detach osixia/phpldapadmin

PHPLDAP_IP=$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" phpldapadmin-service)

echo "Go to: https://$PHPLDAP_IP"
echo "Login DN: cn=admin,dc=example,dc=org"
echo "Password: admin"
```

