### Aufgabe 
xZiel der Übung: die gespeicherten Termine gehen nicht verloren,
auch wenn die containerisierte Anwendung gelöscht wurde. 

### Task: App als Container betreiben
1. Starten Sie die App aus der vorhergehenden Übung mit einem Volume.
2. Lesen Sie den Artikel zu [How Do You Get POSTed JSON in Flask?](https://sentry.io/answers/flask-getting-post-data/). Passen Sie den POST-Request an, damit Sie mind. 2 Termine erfassen, welche in Datei ```appointments.txt``` gespeichert werden.  
3. Stoppen, löschen Sie den Container. Anschliessend starten Sie den Container
mit dem Volume wieder neu.
4. Testen Sie erneut die App und geben Sie die gespeicherten Termine wieder aus.

### Task: Push and Pull to your registry 
1. Login first with your browser on hub.docker.com 
2. Create a public repo with the name-pattern: 
```
<module>-<your-shortname> 
i.e. m347-gada 
```
3. Select an image on your local machine that works. Build and test it.
4. Tag the image and push it to your registry
```
docker tag local-image:tagname new-repo:tagname
docker push new-repo:tagname
```
5. Stop and remove container and image on your local machine
6. Pull your pushed image on your local machine and redo Step 6.