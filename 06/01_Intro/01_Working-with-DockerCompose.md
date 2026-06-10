## Docker Compose

### What is YAML?
YAML = YAML Ain't Markup Language
With Datatypes:
* Scalars (Strings and Numbers)
* Sequences (Arrays and Lists)
* Mappings (Hashes and Dictionaries as Key-Value-Pairs)

### Demo of docker compose
See in Moodle: LU06a - Multicontainer mit Docker-Compose


### Create scripted services
0. Setup docker-compose CLI in your AWS EC2 instance
```
sudo apt install docker-compose
docker-compose --version
docker-compose --help
```
1. Check if YAML-File is present
```
$ ls
docker-compose.yaml
```
2. Spin up services with docker compose. Of course the YAML-File should be present in the working directory!  
```
docker-compose up -d
# or
docker-compose -f <CUSTOM-FILE>.yaml up -d
```
3. Check the created containers
```
$ docker ps
CONTAINER ID   IMAGE              COMMAND                  CREATED         STATUS                     PORTS                   NAMES
2170ab471a31   wordpress:latest   "docker-entrypoint.s…"   4 minutes ago   Up 4 minutes               0.0.0.0:8000->80/tcp    wd_frontend
a0504f6a1b5d   mysql:latest       "docker-entrypoint.s…"   4 minutes ago   Up 4 minutes               3306/tcp, 33060/tcp     mysql_database
...
```
3. Map with ssh Port 8080 (Container) to Port 8081 (Host)
```
ssh -i "${PRIVATE_KEY}" -L 8081:localhost:8080 "${DEST}"
```
4. Now open the browser on http://localhost:8000/ and install Wordpress.
5. Further commands
```
$ docker ps
CONTAINER ID   IMAGE              COMMAND                  CREATED       STATUS       PORTS                  NAMES
2170ab471a31   wordpress:latest   "docker-entrypoint.s…"   5 hours ago   Up 5 hours   0.0.0.0:8000->80/tcp   wd_frontend   
a0504f6a1b5d   mysql:latest       "docker-entrypoint.s…"   5 hours ago   Up 5 hours   3306/tcp, 33060/tcp    mysql_database
```
6. log files of the specific container
```
docker logs -f mysql_database 
# or 
docker logs -f wd_frontend
```
7. the latest 10 log entries
```
docker logs -f mysql_database --tail=10 
```
8. view running process of a container
```
docker top mysql_database
```
9. Removes (or should remove) the multicontainer (including network)
```
docker-compose down -v
or
docker-compose -f <CUSTOM-FILE>.yaml down -v --remove-orphans
``` 
