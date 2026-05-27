### Aufgabe 
### Task: App erweitern als erneut Container publizieren
1. Lesen Sie den Artikel zu [How Do You Get POSTed JSON in Flask?](https://sentry.io/answers/flask-getting-post-data/)
2. Passen Sie den POST-Request an, damit beim Aufruf mit curl und den Parametern 
   * salutation: Mister
   * firstname: John
   * lastname:Doe
   * appointment: 2023-06-23T14:25
die folgende Antwort vom Server erscheint:
```
{"message":"Dear Mister John Doe. You got an appointment on 2023-06-23T14:25. Kind regards Tierpraxis-Team."}
```

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