# Docker 使用总结

## 1.Docker help指令

```shell
root@gateway001:~# docker

Usage:	docker COMMAND

A self-sufficient runtime for containers

Options:
      --config string      Location of client config files (default "/root/.docker")
  -D, --debug              Enable debug mode
  -H, --host list          Daemon socket(s) to connect to
  -l, --log-level string   Set the logging level
                           ("debug"|"info"|"warn"|"error"|"fatal") (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default
                           "/root/.docker/ca.pem")
      --tlscert string     Path to TLS certificate file (default "/root/.docker/cert.pem")
      --tlskey string      Path to TLS key file (default "/root/.docker/key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit

Management Commands:
  config      Manage Docker configs
  container   Manage containers
  image       Manage images
  network     Manage networks
  node        Manage Swarm nodes
  plugin      Manage plugins
  secret      Manage Docker secrets
  service     Manage services
  swarm       Manage Swarm
  system      Manage Docker
  trust       Manage trust on Docker images
  volume      Manage volumes

Commands:
  attach      Attach local standard input, output, and error streams to a running container
  build       Build an image from a Dockerfile
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  diff        Inspect changes to files or directories on a container's filesystem
  events      Get real time events from the server
  exec        Run a command in a running container
  export      Export a container's filesystem as a tar archive
  history     Show the history of an image
  images      List images
  import      Import the contents from a tarball to create a filesystem image
  info        Display system-wide information
  inspect     Return low-level information on Docker objects
  kill        Kill one or more running containers
  load        Load an image from a tar archive or STDIN
  login       Log in to a Docker registry
  logout      Log out from a Docker registry
  logs        Fetch the logs of a container
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  ps          List containers
  pull        Pull an image or a repository from a registry
  push        Push an image or a repository to a registry
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  rmi         Remove one or more images
  run         Run a command in a new container
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  search      Search the Docker Hub for images
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  version     Show the Docker version information
  wait        Block until one or more containers stop, then print their exit codes

Run 'docker COMMAND --help' for more information on a command.
You have new mail in /var/mail/root
root@gateway001:~# 

```



## 2.查询Docker容器ip地址

查看容器的IP地址，可以在主机上运行

```powershell
#查看正在运行的容器的id等信息
docker ps
#“可以查看到容器的相关信息
docker inspect 容器id
#可以查看容器的具体IP地址，如果输出是空的说明没有配置IP地址
docker inspect --format '{{.NetworkSettings.IPAddress}}' 容器id
docker inspect --format '{{.NetworkSettings.IPAddress}}' de73d5c6670b

#在容器内可以查看网络相关的信息

ifconfig查看容器内的网络
cat /etc/hosts查看容器内内部IP映射表
cat /etc/resolv.conf查看容器内dns服务器配置
cat /etc/nsswitch.conf查看容器名字服务配置
ip addr show查看容器IP地址
ip route show查看容器转发信息
netstat -nr查看容器当前IP转发表详细信息

 

查看iptables：

sudo iptables -L -v
如果没有装iptables：
sudo apt-get install iptables
```

## 3.[如何获取 docker 容器(container)的 ip 地址](https://blog.csdn.net/sannerlittle/article/details/77063800)



## 1.客制化配置参数

`NIFI_VARIABLE_REGISTRY_PROPERTIES`可以再`docker run -e`时初始化传入，

或者`docker exec --help`菜单中查询环境变量传入方式；

## 2.Docker使用root用户登录：

```shell
Docker exec -it -u root nifi bash
```



## 3.Docker 容器内外文件复制：

```she'l
# 从docker容器内往宿主机拷贝文件：
Docker cp nifi:/opt/aaa.df /root/nifi-file
```



##  4.docker容器端口添加

### **Docker 给运行中的容器添加映射端口方法1**　　

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

### **Docker 给运行中的容器添加映射端口方法2**

1. 提交一个运行中的容器为镜像

   ```
    $ docker commit containerid foo/live
   ```

2. 运行镜像并添加端口

   ```
   $ docker run -d -p 8000:80  foo/live /bin/bash
   ```



## 5.Linux时区调整：

针对中国时区，修改操作如下

```shell
rm /etc/localtime

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
```

[参考：linux中使用CST时间](http://blog.51cto.com/w55554/1143669)