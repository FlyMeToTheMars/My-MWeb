# Huginn For Docker 

## 拉取镜像

```powershell
docker pull huginn/huginn
```

> Win 拉取过程中如果出现连接超时，可以重启Docker解决连接问题。





## 容器创建脚本

```powershell
# 新建 huginn_mysql 数据库，并创建huginn用户
$ docker run 
	--rm 
	--name huginn_mysql 
	-e MYSQL_DATABASE=huginn 
	-e MYSQL_USER=huginn 
	-e MYSQL_PASSWORD=somethingsecret 
	-e MYSQL_ROOT_PASSWORD=123456@  
	-p 3306:3306 
	mysql:5.7.24
#新建huginn，并使用 huginn_mysql 数据库链接。 
#启动过程比较慢，需耐心等待，访问地址默认为： http://localhost:3000
$ docker run 
	--rm 
	--name huginn 
	--link huginn_mysql:mysql 
	-p 3000:3000 
	-e HUGINN_DATABASE_NAME=huginn 
	-e HUGINN_DATABASE_USERNAME=huginn 
	-e HUGINN_DATABASE_PASSWORD=somethingsecret 
	huginn/huginn
	
#Mysql官方文档
$ docker run --name some-app --link some-mysql:mysql -d application-that-uses-mysql
#正式服安装把数据库的设置设为指定的外部数据库，这样更加灵活。
$ docker run -d --name=huginn `
    -p 3000:3000 `
    -e MYSQL_PORT_3306_TCP_ADDR="172.17.0.1" `
    -e MYSQL_PORT_3306_TCP_PORT="3306" `
	-e DATABASE_NAME="huginn_production" `
    -e DATABASE_USERNAME="root"`
    -e DATABASE_PASSWORD="your password" `
    -e DATABASE_HOST="172.17.0.1" `
    -e DATABASE_PORT="3306" `
    -e SMTP_USER_NAME="info@cz-tek.com" `
    -e SMTP_PASSWORD="your password" `
    -e SMTP_SERVER="smtp.exmail.qq.com" `
    -e SMTP_PORT="587" `
    -e SMTP_AUTHENTICATION="login" `
    -e SMTP_ENABLE_STARTTLS_AUTO="true" `
    -e SEND_EMAIL_IN_DEVELOPMENT="true" `
    -e EMAIL_FROM_ADDRESS="info@cz-tek.com" `
    -e SMTP_DOMAIN="exmail.qq.com" `
    huginn/huginn
    
    
```

## Huginn LocalDockerDB With QQ Mail

```powershell
docker run --name myhuginn 	--link huginn_mysql:mysql `
	-p 13000:3000 `
	-e HUGINN_DATABASE_NAME=huginn `
	-e HUGINN_DATABASE_USERNAME=huginn `
	-e HUGINN_DATABASE_PASSWORD=somethingsecret `
    -e SMTP_USER_NAME="565636992@qq.com" `
    -e SMTP_PASSWORD="rrj78195011" `
    -e SMTP_SERVER="smtp.qq.com" `
    -e SMTP_PORT="587" `
    -e SMTP_AUTHENTICATION="login" `
    -e SMTP_ENABLE_STARTTLS_AUTO="true" `
    -e SEND_EMAIL_IN_DEVELOPMENT="true" `
    -e EMAIL_FROM_ADDRESS="565636992@qq.com" `
    -e SMTP_DOMAIN="qq.com" huginn/huginn
	
```

> 注： Huginn多个实例共用一个数据库的情况下，以后的数据会在实例之间共享。
>
> QQ邮箱配置可参考：[QQ邮箱的POP3与SMTP服务器是什么？](https://service.mail.qq.com/cgi-bin/help?id=28&no=167&subtype=1)



## Huginn RemoteDB（部署服务器）

```powershell
docker run 	--name huginn_remotedb `
	-p 3000:3000 `
    -e MYSQL_PORT_3306_TCP_ADDR="47.96.97.244" `
    -e MYSQL_PORT_3306_TCP_PORT="3306" `
	-e DATABASE_NAME="huginn" `
    -e DATABASE_HOST="47.96.97.244" `
	-e DATABASE_PORT="3306" `
    -e DATABASE_USER="root" `
    -e DATABASE_PASSWORD="123456@" `
    -e SMTP_USER_NAME="info@cz-tek.com" `
    -e SMTP_PASSWORD="Brillianteck123@" `
    -e SMTP_SERVER="smtp.exmail.qq.com" `
    -e SMTP_PORT="587" `
    -e SMTP_AUTHENTICATION="login" `
    -e SMTP_ENABLE_STARTTLS_AUTO="true" `
    -e SEND_EMAIL_IN_DEVELOPMENT="true" `
    -e EMAIL_FROM_ADDRESS="info@cz-tek.com" `
    -e SMTP_DOMAIN="exmail.qq.com"  huginn/huginn
```



更多详细配置，可以到容器中查看隐藏文件 `~/.env`

指令如下：

```powershell
#查看.env文件内容
docker exec -it huginn cat ~/.env
#宿主机中拷贝配置文件到容器
docker cp ./.env huginn:~/.env
```









# Huggin Document  From  GitHub

## Why run Huginn with docker

You can play with or deploy Huginn inside of [docker](http://www.docker.io/).

Getting Huginn up and running using docker is quick and painless once you have docker installed. The docker container is suitable for production and evaluation. Huginn uses environmental variables for configuration, so rather than having a .env file, the Docker container expects variables to be passed into the launch command.

## Running the Container

### Quick start to check out Huginn

#### OSX GUI using Kitematic

1. Download and install [Kitematic](https://kitematic.com/)

- Start Kitematic and search for `huginn/huginn`
- Click `create` and wait for the container to be downloaded and booted
- Click on the link icon next to 'WEB PREVIEW'
- Log in to your Huginn instance using the username `admin` and password `password`

#### OSX/Windows/Linux using docker machine

1. Download [docker machine](https://docs.docker.com/machine/#installation) for your OS

- Follow the installation instructions untill you can successfully run `docker ps`
- Get the the IP of the VM running docker by running `docker-machine ls`
- Start your Huginn container using `docker run -it -p 3000:3000 huginn/huginn`
- Open Huginn in the browser [http://docker-machine ip:3000](http://:3000)
- Log in to your Huginn instance using the username `admin` and password `password`

#### Linux

1. Install docker using the [install instructions](https://docs.docker.com/installation/)

- Start your Huginn container using `docker run -it -p 3000:3000 huginn/huginn`
- Open Huginn in the browser [http://localhost:3000](http://localhost:3000/)
- Log in to your Huginn instance using the username `admin` and password `password`

## Configuration and linking to a database container

Follow the [instructions on the docker hub registry](https://registry.hub.docker.com/u/huginn/huginn/) on how to configure Huginn using environment variables and linking the container to an external MySQL or PostgreSQL database.

## Running each Huginn process in a seperate container

With the `cantino/huginn-single-process` image you can easily run each process needed for Huginn in a separate container and scale them individually when needed. Have a look at the [Docker hub](https://hub.docker.com/r/huginn/huginn-single-process/) and the [documentation for the container](https://github.com/huginn/huginn/tree/master/docker/single-process)

### Other options:

Other Docker options:

- If you don't want to use the official repo, see also: <https://registry.hub.docker.com/u/andrewcurioso/huginn/>
- If you'd like to run Huginn's web process and job worker process in separate containers, another option is <https://github.com/hackedu/huginn-docker>. It also uses Unicorn as the web server and serves precompiled assets.









-----

# [Huginn for docker with multiple container linkage](https://hub.docker.com/r/huginn/huginn)

This image runs a linkable [Huginn](https://github.com/huginn/huginn) instance.

There is an automated build repository on docker hub for [huginn/huginn](https://hub.docker.com/r/huginn/huginn/builds/).

This was patterned after [sameersbn/gitlab](https://registry.hub.docker.com/u/sameersbn/gitlab) by [ianblenke/huginn](http://github.com/ianblenke/huginn), and imported here for official generation of a docker hub auto-build image.

The scripts/init script generates a .env file containing the variables as passed as per normal Huginn documentation. The same environment variables that would be used for Heroku PaaS deployment are used by this script.

The scripts/init script is aware of mysql and postgres linked containers through the environment variables:

```
MYSQL_PORT_3306_TCP_ADDR
MYSQL_PORT_3306_TCP_PORT
```

and

```
POSTGRES_PORT_5432_TCP_ADDR
POSTGRES_PORT_5432_TCP_PORT
```

Its recommended to use an image that allows you to create a database via environmental variables at docker run, like `paintedfox / postgresql` or `centurylink / mysql`, so the db is populated when this script runs.

If you do not link a database container, a built-in mysql database will be started. There is an exported docker volume of `/var/lib/mysql` to allow persistence of that mysql database.

**NOTE:** If you do not export the volme, or use a linked database container, you cannot update Huginn without losing your data.

Additionally, the database variables may be overridden from the above as per the standard Huginn documentation:

```
DATABASE_ADAPTER #(must be either 'postgresql' or 'mysql2')
DATABASE_HOST
DATABASE_PORT
```

When connecting to an external database and your user does not have the permission to create the Huginn database please make sure it exists and set the `DO_NOT_CREATE_DATABASE` environment variable.

This script will run database migrations (rake db:migrate) which should be idempotent.

It will also seed the database (rake db:seed) unless this is defined:

```
DO_NOT_SEED
```

This same seeding initially defines the "admin" user with a default password of "password" as per the standard Huginn documentation.

If you do not wish to have the default 6 agents, you will want to set the above environment variable after your initially deploy, otherwise they will be added automatically the next time a container pointing at the database is spun up.

The CMD launches Huginn via the scripts/init script. This may become the ENTRYPOINT later. It does take under a minute for Huginn to come up. Use environmental variables that match your DB's creds to ensure it works.

## Usage

Simple stand-alone usage (use only for testing/evaluation as it can not be updated without losing data):

```
docker run -it -p 3000:3000 huginn/huginn
```

Use a volume to export the data of the internal mysql server:

```
docker run -it -p 3000:3000 -v /home/huginn/mysql-data:/var/lib/mysql huginn/huginn
```

To link to another mysql container, for example:

```
docker run --rm --name huginn_mysql \
    -e MYSQL_DATABASE=huginn \
    -e MYSQL_USER=huginn \
    -e MYSQL_PASSWORD=somethingsecret \
    -e MYSQL_ROOT_PASSWORD=somethingevenmoresecret \
    mysql
docker run --rm --name huginn \
    --link huginn_mysql:mysql \
    -p 3000:3000 \
    -e HUGINN_DATABASE_NAME=huginn \
    -e HUGINN_DATABASE_USERNAME=huginn \
    -e HUGINN_DATABASE_PASSWORD=somethingsecret \
    huginn/huginn
```

To link to another container named 'postgres':

```
docker run --name huginn_postgres \
    -e POSTGRES_PASSWORD=mysecretpassword \
    -e POSTGRES_USER=huginn -d postgres
docker run --rm --name huginn \
    --link huginn_postgres:postgres \
    -p 3000:3000 \
    -e HUGINN_DATABASE_USERNAME=huginn \
    -e HUGINN_DATABASE_PASSWORD=mysecretpassword \
    -e HUGINN_DATABASE_ADAPTER=postgresql \
    huginn/huginn
```

The `docker/multi-process` folder also has a `docker-compose.yml` that allows for a sample database formation with a data volume container:

```
cd docker/multi-process ; docker-compose up
```

## Environment Variables

Other Huginn 12factored environment variables of note, as generated and put into the .env file as per Huginn documentation. All variables of the [.env.example](https://github.com/huginn/huginn/blob/master/.env.example) can be used to override the defaults which a read from the current `.env.example`.

For variables in the .env.example that are commented out, the default is to not include that variable in the generated .env file.

## Building on your own

You don't need to do this on your own, because there is an [automated build](https://registry.hub.docker.com/u/huginn/huginn/) for this repository, but if you really want run this command in the Huginn root directory:

```
docker build --rm=true --tag={yourname}/huginn -f docker/multi-process/Dockerfile .
```

## Source

The source is [available on GitHub](https://github.com/huginn/huginn/docker/multi-process/).

Please feel free to submit pull requests and/or fork at your leisure.



