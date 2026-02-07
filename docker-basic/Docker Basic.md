> # Docker Shell Scripts
>
> Docker shell scripts lists.

### 1.1. Docker Images

- List all docker images that are already pulled from the docker registry:

```sh
docker image ls
```

- Pull a specific docker image and tag from the docker registry:

```sh
docker image pull imagename:tag
```

- Remove a specific docker image and tag from the pulled images:

```sh
docker image rm imagename:tag
```

> **Visit docker hub** > _**[hub.docker.com](https://hub.docker.com/)**_

### 1.2. Docker Container

#### 1.2.1. Docker Container Basic

- List all active containers currently running in Docker:

```sh
docker container ls
```

- List all containers, whether running or not:

```sh
docker container ls -a
```

- `-a` selects all containers in the list.

- Create a container:

```sh
docker container create --name containername imagename:tag
```

- `--name` assigns a name tag for the container.

- Start a container that has already been created:

```sh
docker container start containername
```

- Stop a running container:

```sh
docker container stop containerid/containername
```

- Remove a container that has already been stopped:

```sh
docker container rm containerid/containername
```

#### 1.2.2. Docker Container Log

- View the logs of a container:

```sh
docker container logs containerid/containername
```

- Stream container logs in real time:

```sh
docker container logs -f containerid/containername
```

- `-f` streams logs in real time.

#### 1.2.3. Docker Container Exec

- Enter into a container's shell:

```sh
docker container exec -i -t containerid/containername /bin/bash
```

or

```sh
docker container exec -it containerid/containername /bin/bash
```

- `-i` keeps input active
- `-t` allocates a pseudo-TTY for terminal access.

#### 1.2.4. Docker Container Port

- Port Forwarding

```sh
docker container --name containername --publish porthost:portcontainer image:tag
```

- `--publish` or `-p` port forwarding argument, can be added more than one by using more arguments.

#### 1.2.5. Docker Container Environment Variable

- To add environment variable

```sh
docker container create --name containername --env KEY="value" --env KEY2="value" image:tag
```

- `--env` or `-e` arguments for adding environment variable when creating container.

#### 1.2.6. Docker Container Stats

- Resource every container that's running

```sh
docker container stats
```

#### 1.2.7. Docker Container Resource Limit

- Limiting container memory resource

```sh
docker container create --name containername imagename:tag --memory 1g
```

- `--memory` memory argument to limit specific how much memory being used, can be in b (bytes), k (kilo bytes), m (mega bytes), atau g (giga bytes), e.g 100m meaning 100 mega bytes

- Limiting container cpu resource

```sh
docker container create --name containername --cpus 0.5 imagename:tag
```

- `--cpus` cpu memory arguments to limit the amount of cpu being used from docker host, e.g `--cpus 1.5` the resource taken by the container is 1.5 from docker host

### 1.3. Docker Bind Mounts

Bind mounts, the ability to mount (sharing) file or folder that's in host system to container available in docker

- Bind Mounting

```sh
docker container create --name containername --mount "type=bind,source=folder,destination=folder,readonly" image:tag
```

- `type` mount type, bind or volume
- `source` file location or folder in host system
- `destination` file location or folder in container
- `readonly` to make file or folder readonly in container, cannot be written.

### 1.4. Docker Volume

Docker Volume is the newest version that's recommended.

- Listing all docker volume

```sh
docker volume ls
```

- Creating new volume

```sh
docker volume create volumename
```

- Deleting exsisting volume, to delete existing volume, make sure that the volume isn't used by any container.

```sh
docker volume volumename
```

#### 1.4.1. Docker Container Volume

Volume that's already created can be used in container.
The advantges from using volume is when the container deleted, the data still available in volume.
To use volume in container is still the same using bind mount, by using `--mount` argument, and using the type volume and source name volume

```sh
docker container create --name containername --mount "type=volume,source=volumesource,destination=folder" imagename:tag
```

#### 1.4.2. Docker Backup Volume

To this day 18 March 2025 there's no automatic way to backup volume that's already created.
But it **can be achieved** by using container to backup data that's in the volume into archive like zip or tar.gz.
To achieve this you need to do this step:

- Firstly turn off the container that's using the volume that want to be backup.
- Make container with two mount, volume that to be backup, and bind mount folder from host system.
- Do backup using container by using archive volume data, and save it in bind mount folder.
- Fill backup data in the system host folder.
- Delete container that's already been used for backup.

```sh
docker container create --name containername_backup --mount "type=bind,source=host_folder,destination=/backup" --mount "type=volume,source=volumename,destination=/data" imagename:tag
docker container start containername_backup
docker container name -it containername_backup /bin/bash
```

after entering container bash, use tar to archive the data.

```sh
tar cvf /dest/backup.tar.gz /dest-from
tar cvf /backup/backup.tar.gz /data
```

then after that removing the docker backup container is needed.

Or

You can use one line shell script, by using `--rm` to automaticly remove container after the script done running.

```sh
docker run --rm --name containername_backup --mount "type=bind,source=host_folder,destination=/backup" --mount "type=volume,source=volumename,destination=/data" imagename:tag tar cvf /backup/backup.tar.gz /data
```

- `--rm` is being used to remove container after the container done running following shell script.

#### 1.4.3. Docker Restore Volume

To restore volume you could use the backward method from backup volume, by bind mount the host and mount volume and extract the backup-ed volume, literally **almost the same** command like doing backup a volume, the only difference is in the last command that use bash to enter volume directory and extract backup-ed _tar.gz_ file from bind mounted host into the current volume directory.

```sh
docker container run --rm --name containername --mount "type=bind,source=host_folder,destination=/backup" --mount "type=volume,source=volumename,destination=/data" imagename:tag bash -c "cd /data && tar xvf /backup/backup.tar.gz --strip 1"
```

- make sure the `imagename` can be closed after running the bash commands, unlike nginx it

### 1.5. Docker Network

To make a network in docker, driver is needed to make a Docker Network, and there are plenty types of driver for Networking in Docker.
Bridge driver is used to make network virtually interconnected container in bridge network.
Host driver is used to create network in the same network as the system host. Host only run in Docker Linux, and cannot be used in Mac or Windows.
None driver, is to make network that cannot communicate eachother.

- To list all network in docker

```sh
docker network ls
```

- To create a new network

```sh
docker network create --driver drivername networkname
```

- To remove docker network
  To remove a network, make sure there are none of any container connected to the network.

```sh
docker network rm networkname
```

#### 1.5.1. Docker Container Network

- After creating a Network in docker, to make the container accessing the network, firstly need to create a network.

Connecting a Container to a Docker Network

```sh
docker container create --name containername --network networkname image:tag
```

Connecting an exsisting container into a Network

```sh
docker network connect [OPTIONS] networkname containername
```

Options:

- `--alias "strings"`: Add network-scoped alias for the container.
- `--driver-opt "strings"`: driver options for the network.
- `--gw-priority 'int'`: Highest gw-priority provides the default gateway. Accepts positive and negative values.
- `--ip "string"`: IPv4 address (e.g., "172.30.100.104").
- `--ip6 "string"`: IPv6 address (e.g., "2001:db8::33").
- `--link "list"`: Add link to another container.
- `--link-local-ip "strings"`: Add a link-local address for the container.

Disconnecting container from a network

```sh
docker network disconnect [OPTIONS] networkname containername
```

Options:

- `-f`,`--force`: Force the container to disconnect from a network.

### 1.6. Docker Inspect

- To inspect any image, container, volume, and a network in Docker.

```sh
docker image inspect imagename
docker container inspect containername
docker volume inspect volumename
docker network inspect networkname
```

### 1.7. Docker Prune

Deleting container that's already stopped, image that's not used by container, network that's not used by container, and volume that's not been used by any container.

```sh
docker image prune
docker container prune
docker network prune
docker volume prune
```

Or to prune all image, container, and network, not volumes.

```sh
docker system prune
```
