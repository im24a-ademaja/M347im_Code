## Working with Volumes
### Create a bind mount
1. Create in your HOME an empty directory bind-data. 
Then Run a container cont_muha and bind mount the directory 
bind-data with the container on /tmp.
```
$ cd;pwd #change to HOME and show path
$ mkdir bind-data
$ docker run -itd \
    --name con1 \
    --mount type=bind,source="/c/Users/info/bind-data",target=/tmp \
    ubuntu:latest
42a026a9de80da726cd3683b04ff7a88673cc1c3316665ff79563547a90aa028
```
2. Check availability of the container
```
$ docker ps -a
CONTAINER ID   IMAGE           COMMAND                  CREATED         STATUS            NAMES    
42a026a9de80   ubuntu:latest   "/bin/bash"              9 seconds ago   Up 8 seconds      con1 
```
3. Inspect the container (only mount-part of the output). Pay attention to option RW=true
```
$ docker container inspect --format "{{json .Mounts}}" con1 | python -m json.tool
[
    {
        "Type": "bind",
        "Source": "C:/Users/info/bind-data",
        "Destination": "/tmp",
        "Mode": "",
        "RW": true,
        "Propagation": "rprivate"
    }
]
```
3. Access the container by executing the bash-shell, 
then touch /tmp/foo.txt 
```
$  docker exec -it con1 bash
root@42a026a9de80:/# touch /tmp/foo.txt
root@42a026a9de80:/# cd tmp/
root@42a026a9de80:/tmp# ls
foo.txt                 
root@42a026a9de80:/tmp# 
```
4. Now check in a second shell on the host computer if
the touched file exists
```
$ cd #change to HOME
$ cd bind-data/      
$ ls                           
foo.txt
```
5. Now touch on the host computer a new file
```
$ touch foo2.txt
```
6. Check now in the container if the new file exists
```
root@42a026a9de80:/tmp# ls
foo.txt  foo2.txt 
```~~~~