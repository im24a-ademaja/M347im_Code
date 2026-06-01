## Working with bind mount
### Create volumes
1. Run a container con_02 with volume *vol-02* and mount
this volume in the container on /var/log
```
$ docker run -itd --name con_02 --volume vol-02:/var/log ubuntu:latest
6ce52f42393c15c32bb7d5cfb02e058cec918e9d07d8940b4ef2879607dc7d59
```
2. Check availability of volume and container
```
$ docker ps -a; docker volume ls
CONTAINER ID   IMAGE           COMMAND                  CREATED          STATUS            NAMES   
ce8814c76880   ubuntu:latest   "/bin/bash"              39 seconds ago   Up 38 seconds     con_02  
...
DRIVER    VOLUME NAME
...
local     vol-02
```
3. Inspect the container (only mount-part of the output)
```
$ docker container inspect --format "{{json .Mounts}}" con_02 | python -m json.tool
[
    {
        "Type": "volume",
        "Name": "vol-02",
        "Source": "/var/lib/docker/volumes/vol-02/_data",
        "Destination": "/var/log",
        "Driver": "local",
        "Mode": "z",
        "RW": true,
        "Propagation": ""
    }
]
```
3. Access the container by executing the bash-shell, 
then change to the log directory and list the output. 
```
$ docker exec -it con_02 bash
root@ce8814c76880:/#
root@ce8814c76880:/# cd /var/log
root@ce8814c76880:/var/log# ls
alternatives.log  apt  bootstrap.log  btmp  dpkg.log  faillog  lastlog  wtmp
```
4. Because we have mounted a volume on the mount-point /var/log we should be able 
to see the data even if the container is stopped. Let's see if it's the case.
Exit and stop the container
```
root@ce8814c76880:/var/log# exit
exit
$ docker stop con_02
con_02
```
5. Check with Docker-Desktop if log-data are still available
See 02b_Volumes-applied.mp4