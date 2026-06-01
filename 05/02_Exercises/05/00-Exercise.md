## Aufgabe: Hosting a Game with Container
#### Pre-requisits
Sie haben bereits ein nginx Image von hub.docker.com gepulled, 
um damit den nginx-Container zu starten.

### Step-By-Step-Guide
1. Clone Sie das 2048-Repo und wechseln Sie in das Verzeichnis
```
git clone https://github.com/cerulean-canvas/2048.git
cd 2048
```
2. Starten Sie den Container mit bind mount
```
docker run -itd \
    --name 2048 \
    --mount type=bind,source="$(pwd)"/,target=/usr/share/nginx/html \
    -p 8080:80 \
    nginx:latest
```
3. Mappen Sie über ssh den Port 8080 (Container) auf Port 8081 (Host)
```
ssh -i "${PRIVATE_KEY}" -L 8081:localhost:8080 "${DEST}"
```
4. Öffnen Sie den Browser mit der URL http://localhost:8081/
5. Lesen Sie die Spiel-Anleitung. (siehe z.B. https://www.youtube.com/watch?v=kQhkkqjGkFA)
6. Mit wie vielen Zügen erreichen Sie die Zahl 2048? Bei mehr als 2048 haben
Sie das Spiel verloren. Viel Spass dabei! 
