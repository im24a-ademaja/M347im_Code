## Basic commands for Volumes
### Create volumes and check volume contents
1. Create a volume with name *vol-01* 
```
$ docker volume create vol-01
vol-01
```
2. Create an additional volume with name *vol-02* in a different style.
Run the container ubuntu and mount volume on the mount-point '/data'
```
$ docker pull ubuntu:latest
$ docker image ls
REPOSITORY                  TAG       IMAGE ID       CREATED        SIZE
...
ubuntu                      latest    1f6ddc1b2547   5 weeks ago    77.8MB
...

$ docker run -itd --rm --name app1 --volume vol-02:/data ubuntu
8f4b3ac574160dcd942d43eeb922b7ab1f8f95f7a4ddcaa88e18ac872cf7bcfd
```

Enter container
```
docker exec -it app1 bash
root@262285e19d23:/# ls data
root@262285e19d23:/# cd data
root@262285e19d23:/data# touch hello.txt
root@262285e19d23:/data# echo "Hallo Klasse" > hello.txt
root@262285e19d23:/data# cat hello.txt
Hallo Klasse
root@262285e19d23:/data# exit
```

Stop (and remove if --rm was applied) container
```
ubuntu@ip-172-31-26-236:~$ docker stop 262
```

```
docker run -itd --rm --name app2 --volume vol-02:/data ubuntu
docker exec -it app2 bash
root@f8a3e9084055:/# cat /data/hello.txt
Hallo Klasse
```

3. List all volumes
```
$ docker volume ls
DRIVER    VOLUME NAME
local     vol-01     
local     vol-02  
```
4. List all volumes that are not mounted to any container
```
$ docker volume ls --filter "dangling=true"
DRIVER    VOLUME NAME
local     vol-01
```

### Inspect volumes
1. Inspect volume vol-01
```
$ docker volume inspect vol-01
[
    {
        "CreatedAt": "2023-06-29T15:17:55Z",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/vol-01/_data",
        "Name": "vol-01",
        "Options": null,
        "Scope": "local"
    }
]
```

### Remove volumes
1. In order to remove vol-02, we need first to stop the container 
else we'll get an error message.
```
$ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS                     PORTS                   NAMES
8f4b3ac57416   ubuntu    "/bin/bash"              9 minutes ago   Exited (0) 9 minutes ago                           bori
ng_davinci

$ docker container rm boring_davinci
boring_davinci
```

2. Now remove volume vol-02
```
$ docker volume rm vol-02
vol-02
```