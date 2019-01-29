# [apache/nifi](https://hub.docker.com/r/apache/nifi)

By [apache](https://hub.docker.com/u/apache)  • Updated 2 months ago

Unofficial convenience binaries and Docker images for Apache NiFi 

## Latest changes

### 1.8.0

- The NiFi Toolkit has been added to the image under the path `/opt/nifi/nifi-toolkit-current` also set as the environment variable `NIFI_TOOLKIT_HOME`

- The installation directory and related environment variables are changed to be version-agnostic to

   `/opt/nifi/nifi-current`:

  ```
  docker run --rm --entrypoint /bin/bash apache/nifi:1.8.0 -c 'env | grep NIFI'
  NIFI_HOME=/opt/nifi/nifi-current
  NIFI_LOG_DIR=/opt/nifi/nifi-current/logs
  NIFI_TOOLKIT_HOME=/opt/nifi/nifi-toolkit-current
  NIFI_PID_DIR=/opt/nifi/nifi-current/run
  NIFI_BASE_DIR=/opt/nifi
  ```

- A symlink refer to the new path for backward compatibility:

  ```
  docker run --rm --entrypoint /bin/bash apache/nifi:1.8.0 -c 'readlink /opt/nifi/nifi-1.8.0' /opt/nifi/nifi-current
  ```

# Docker Image Quickstart

## Capabilities

This image currently supports running in standalone mode either unsecured or with user authentication provided through:

- [Two-Way SSL with Client Certificates](http://nifi.apache.org/docs/nifi-docs/html/administration-guide.html#security-configuration)
- [Lightweight Directory Access Protocol (LDAP)](http://nifi.apache.org/docs/nifi-docs/html/administration-guide.html#ldap_login_identity_provider)

This image also contains the NiFi Toolkit (as of version 1.8.0) preconfigured to use either in secure and unsecure mode.

## Building

The Docker image can be built using the following command:

```
docker build -t apache/nifi:latest .
```

This build will result in an image tagged apache/nifi:latest

```
# user @ puter in ~/Development/code/apache/nifi/nifi-docker/dockerhub
$ docker images
REPOSITORY               TAG                 IMAGE ID            CREATED                 SIZE
apache/nifi              latest              f0f564eed149        A long, long time ago   1.62GB
```

**Note**: The default version of NiFi specified by the Dockerfile is typically that of one that is unreleased if working from source. To build an image for a prior released version, one can override the `NIFI_VERSION` build-arg with the following command:

```
docker build --build-arg=NIFI_VERSION={Desired NiFi Version} -t apache/nifi:latest .
```

There is, however, no guarantee that older versions will work as properties have changed and evolved with subsequent releases. The configuration scripts are suitable for at least 1.4.0+.

## Running a container

### Standalone Instance, Unsecured

The minimum to run a NiFi instance is as follows:

```
docker run --name nifi \
  -p 18080:8080 \
  -d \
  apache/nifi:latest
```

This will provide a running instance, exposing the instance UI to the host system on at port 8080, viewable at `http://localhost:8080/nifi`.

You can also pass in environment variables to change the NiFi communication ports and hostname using the Docker '-e' switch as follows:

```
docker run --name nifi \
  -p 9090:9090 \
  -d \
  -e NIFI_WEB_HTTP_PORT='9090'
  apache/nifi:latest
```

For a list of the environment variables recognised in this build, look into the .sh/secure.sh and .sh/start.sh scripts

### Standalone Instance, Two-Way SSL

In this configuration, the user will need to provide certificates and the associated configuration information. Of particular note, is the `AUTH` environment variable which is set to `tls`. Additionally, the user must provide an the DN as provided by an accessing client certificate in the `INITIAL_ADMIN_IDENTITY` environment variable. This value will be used to seed the instance with an initial user with administrative privileges. Finally, this command makes use of a volume to provide certificates on the host system to the container instance.

```
docker run --name nifi \
  -v /User/dreynolds/certs/localhost:/opt/certs \
  -p 8443:8443 \
  -e AUTH=tls \
  -e KEYSTORE_PATH=/opt/certs/keystore.jks \
  -e KEYSTORE_TYPE=JKS \
  -e KEYSTORE_PASSWORD=QKZv1hSWAFQYZ+WU1jjF5ank+l4igeOfQRp+OSbkkrs \
  -e TRUSTSTORE_PATH=/opt/certs/truststore.jks \
  -e TRUSTSTORE_PASSWORD=rHkWR1gDNW3R9hgbeRsT3OM3Ue0zwGtQqcFKJD2EXWE \
  -e TRUSTSTORE_TYPE=JKS \
  -e INITIAL_ADMIN_IDENTITY='CN=Random User, O=Apache, OU=NiFi, C=US' \
  -d \
  apache/nifi:latest
```

### Standalone Instance, LDAP

In this configuration, the user will need to provide certificates and the associated configuration information. Optionally, if the LDAP provider of interest is operating in LDAPS or START_TLS modes, certificates will additionally be needed. Of particular note, is the `AUTH` environment variable which is set to `ldap`. Additionally, the user must provide a DN as provided by the configured LDAP server in the `INITIAL_ADMIN_IDENTITY` environment variable. This value will be used to seed the instance with an initial user with administrative privileges. Finally, this command makes use of a volume to provide certificates on the host system to the container instance.

#### For a minimal, connection to an LDAP server using SIMPLE authentication:

```
docker run --name nifi \
  -v /User/dreynolds/certs/localhost:/opt/certs \
  -p 8443:8443 \
  -e AUTH=ldap \
  -e KEYSTORE_PATH=/opt/certs/keystore.jks \
  -e KEYSTORE_TYPE=JKS \
  -e KEYSTORE_PASSWORD=QKZv1hSWAFQYZ+WU1jjF5ank+l4igeOfQRp+OSbkkrs \
  -e TRUSTSTORE_PATH=/opt/certs/truststore.jks \
  -e TRUSTSTORE_PASSWORD=rHkWR1gDNW3R9hgbeRsT3OM3Ue0zwGtQqcFKJD2EXWE \
  -e TRUSTSTORE_TYPE=JKS \
  -e INITIAL_ADMIN_IDENTITY='cn=admin,dc=example,dc=org' \
  -e LDAP_AUTHENTICATION_STRATEGY='SIMPLE' \
  -e LDAP_MANAGER_DN='cn=admin,dc=example,dc=org' \
  -e LDAP_MANAGER_PASSWORD='password' \
  -e LDAP_USER_SEARCH_BASE='dc=example,dc=org' \
  -e LDAP_USER_SEARCH_FILTER='cn={0}' \
  -e LDAP_IDENTITY_STRATEGY='USE_DN' \
  -e LDAP_URL='ldap://ldap:389' \
  -d \
  apache/nifi:latest
```

#### The following, optional environment variables may be added to the above command when connecting to a secure LDAP server configured with START_TLS or LDAPS

```
-e LDAP_TLS_KEYSTORE: ''
-e LDAP_TLS_KEYSTORE_PASSWORD: ''
-e LDAP_TLS_KEYSTORE_TYPE: ''
-e LDAP_TLS_TRUSTSTORE: ''
-e LDAP_TLS_TRUSTSTORE_PASSWORD: ''
-e LDAP_TLS_TRUSTSTORE_TYPE: ''
```

#### Clustering can be enabled by using the following properties to Docker environment variable mappings.

##### nifi.properties

| Property                                  | Environment Variable                   |
| ----------------------------------------- | -------------------------------------- |
| nifi.cluster.is.node                      | NIFI_CLUSTER_IS_NODE                   |
| nifi.cluster.node.address                 | NIFI_CLUSTER_ADDRESS                   |
| nifi.cluster.node.protocol.port           | NIFI_CLUSTER_NODE_PROTOCOL_PORT        |
| nifi.cluster.node.protocol.threads        | NIFI_CLUSTER_NODE_PROTOCOL_THREADS     |
| nifi.cluster.node.protocol.max.threads    | NIFI_CLUSTER_NODE_PROTOCOL_MAX_THREADS |
| nifi.zookeeper.connect.string             | NIFI_ZK_CONNECT_STRING                 |
| nifi.zookeeper.root.node                  | NIFI_ZK_ROOT_NODE                      |
| nifi.cluster.flow.election.max.wait.time  | NIFI_ELECTION_MAX_WAIT                 |
| nifi.cluster.flow.election.max.candidates | NIFI_ELECTION_MAX_CANDIDATES           |

##### state-management.xml

| Property Name  | Environment Variable   |
| -------------- | ---------------------- |
| Connect String | NIFI_ZK_CONNECT_STRING |
| Root Node      | NIFI_ZK_ROOT_NODE      |

### Using the Toolkit

Start the container:

```
docker run -d --name nifi apache/nifi
```

After NiFi has been started, it is possible to run toolkit commands against the running instance:

```
docker exec -ti nifi nifi-toolkit-current/bin/cli.sh nifi current-user
anonymous
```

## Configuration Information

The following ports are specified by default in Docker for NiFi operation within the container and can be published to the host.

| Function                 | Property                      | Port  |
| ------------------------ | ----------------------------- | ----- |
| HTTP Port                | nifi.web.http.port            | 8080  |
| HTTPS Port               | nifi.web.https.port           | 8443  |
| Remote Input Socket Port | nifi.remote.input.socket.port | 10000 |

The Variable Registry can be configured for the docker image using the `NIFI_VARIABLE_REGISTRY_PROPERTIES`environment variable.

======= **NOTE**: If mapping the HTTPS port specifying trusted hosts should be provided for the property *nifi.web.proxy.host*. This property can be specified to running instances via specifying an environment variable at container instantiation of _NIFI_WEB_PROXY_HOST_.





## 注意事项：

### 1.客制化配置参数

`NIFI_VARIABLE_REGISTRY_PROPERTIES`可以再`docker run -e`时初始化传入，

或者`docker exec --help`菜单中查询环境变量传入方式；

## 2.Docker使用root用户登录：

```shell
Docker exec -it -u root nifi bash
```



### 3.Docker 容器内外文件复制：

```she&#39;l
# 从docker容器内往宿主机拷贝文件：
Docker cp nifi:/opt/aaa.df /root/nifi-file
```



###  4.docker容器端口添加

**Docker 给运行中的容器添加映射端口方法1**　　

1. 获得容器IP

   ```
    $ docker inspect `container_name` | grep IPAddress
   ```

   比如我的容器叫`mysqlserver`么就输入下列代码来获取该容器的ip地址

   ```
    $ docker inspect mysqlserver | grep IPAddress
   ```

   执行完之后会发现我的`mysqlserver`docker容器的ip地址为`192.168.0.2`

2. iptables转发端口

   比如我将容器的3306端口映射到主机的37221端口，那么ip对应就写入我的docker容器IP即可

   ```
   iptables -t nat -A DOCKER -p tcp --dport 37221 -j DNAT --to-destination 192.168.0.2:3306
   ```

**Docker 给运行中的容器添加映射端口方法2**

1. 提交一个运行中的容器为镜像

   ```
    $ docker commit containerid foo/live
   ```

2. 运行镜像并添加端口

   ```
   $ docker run -d -p 8000:80  foo/live /bin/bash
   ```





# Dockerfile

```SHELL
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements. See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership. The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License. You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied. See the License for the
# specific language governing permissions and limitations
# under the License.
#

FROM openjdk:8-jre
LABEL maintainer="Apache NiFi <dev@nifi.apache.org>"
LABEL site="https://nifi.apache.org"

ARG UID=1000
ARG GID=1000
ARG NIFI_VERSION=1.8.0
ARG BASE_URL=https://archive.apache.org/dist
ARG MIRROR_BASE_URL=${MIRROR_BASE_URL:-${BASE_URL}}
ARG NIFI_BINARY_PATH=${NIFI_BINARY_PATH:-/nifi/${NIFI_VERSION}/nifi-${NIFI_VERSION}-bin.zip}
ARG NIFI_TOOLKIT_BINARY_PATH=${NIFI_TOOLKIT_BINARY_PATH:-/nifi/${NIFI_VERSION}/nifi-toolkit-${NIFI_VERSION}-bin.zip}

ENV NIFI_BASE_DIR=/opt/nifi
ENV NIFI_HOME ${NIFI_BASE_DIR}/nifi-current
ENV NIFI_TOOLKIT_HOME ${NIFI_BASE_DIR}/nifi-toolkit-current

ENV NIFI_PID_DIR=${NIFI_HOME}/run
ENV NIFI_LOG_DIR=${NIFI_HOME}/logs

ADD sh/ ${NIFI_BASE_DIR}/scripts/

# Setup NiFi user and create necessary directories
RUN groupadd -g ${GID} nifi || groupmod -n nifi `getent group ${GID} | cut -d: -f1` \
&& useradd --shell /bin/bash -u ${UID} -g ${GID} -m nifi \
&& mkdir -p ${NIFI_BASE_DIR} \
&& chown -R nifi:nifi ${NIFI_BASE_DIR} \
&& apt-get update \
&& apt-get install -y jq xmlstarlet procps

USER nifi

# Download, validate, and expand Apache NiFi Toolkit binary.
RUN curl -fSL ${MIRROR_BASE_URL}/${NIFI_TOOLKIT_BINARY_PATH} -o ${NIFI_BASE_DIR}/nifi-toolkit-${NIFI_VERSION}-bin.zip \
&& echo "$(curl ${BASE_URL}/${NIFI_TOOLKIT_BINARY_PATH}.sha256) *${NIFI_BASE_DIR}/nifi-toolkit-${NIFI_VERSION}-bin.zip" | sha256sum -c - \
&& unzip ${NIFI_BASE_DIR}/nifi-toolkit-${NIFI_VERSION}-bin.zip -d ${NIFI_BASE_DIR} \
&& rm ${NIFI_BASE_DIR}/nifi-toolkit-${NIFI_VERSION}-bin.zip \
&& mv ${NIFI_BASE_DIR}/nifi-toolkit-${NIFI_VERSION} ${NIFI_TOOLKIT_HOME} \
&& ln -s ${NIFI_TOOLKIT_HOME} ${NIFI_BASE_DIR}/nifi-toolkit-${NIFI_VERSION}

# Download, validate, and expand Apache NiFi binary.
RUN curl -fSL ${MIRROR_BASE_URL}/${NIFI_BINARY_PATH} -o ${NIFI_BASE_DIR}/nifi-${NIFI_VERSION}-bin.zip \
&& echo "$(curl ${BASE_URL}/${NIFI_BINARY_PATH}.sha256) *${NIFI_BASE_DIR}/nifi-${NIFI_VERSION}-bin.zip" | sha256sum -c - \
&& unzip ${NIFI_BASE_DIR}/nifi-${NIFI_VERSION}-bin.zip -d ${NIFI_BASE_DIR} \
&& rm ${NIFI_BASE_DIR}/nifi-${NIFI_VERSION}-bin.zip \
&& mv ${NIFI_BASE_DIR}/nifi-${NIFI_VERSION} ${NIFI_HOME} \
&& mkdir -p ${NIFI_HOME}/conf \
&& mkdir -p ${NIFI_HOME}/database_repository \
&& mkdir -p ${NIFI_HOME}/flowfile_repository \
&& mkdir -p ${NIFI_HOME}/content_repository \
&& mkdir -p ${NIFI_HOME}/provenance_repository \
&& mkdir -p ${NIFI_HOME}/state \
&& mkdir -p ${NIFI_LOG_DIR} \
&& ln -s ${NIFI_HOME} ${NIFI_BASE_DIR}/nifi-${NIFI_VERSION}

VOLUME ${NIFI_LOG_DIR} \
${NIFI_HOME}/conf \
${NIFI_HOME}/database_repository \
${NIFI_HOME}/flowfile_repository \
${NIFI_HOME}/content_repository \
${NIFI_HOME}/provenance_repository \
${NIFI_HOME}/state

# Clear nifi-env.sh in favour of configuring all environment variables in the Dockerfile
RUN echo "#!/bin/sh\n" > $NIFI_HOME/bin/nifi-env.sh

# Web HTTP(s) & Socket Site-to-Site Ports
EXPOSE 8080 8443 10000

WORKDIR ${NIFI_HOME}

# Apply configuration and start NiFi
#
# We need to use the exec form to avoid running our command in a subshell and omitting signals,
# thus being unable to shut down gracefully:
# https://docs.docker.com/engine/reference/builder/#entrypoint
#
# Also we need to use relative path, because the exec form does not invoke a command shell,
# thus normal shell processing does not happen:
# https://docs.docker.com/engine/reference/builder/#exec-form-entrypoint-example
ENTRYPOINT ["../scripts/start.sh"]
```

