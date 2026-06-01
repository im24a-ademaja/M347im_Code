### Aufgabe: Termine-App lokal starten und testen
#### Pre-requisits
Für diese Aufgabe werden python und pip vorausgesetzt. 
Ferner lohnt es sich, die Pakete im virtual environment zu installieren  

#### Setup
1. show python and pip version
```python --version```
```pip --version```
2. setup virtual environment with same name venv
```py -m venv venv```
3. copy deactivate script in virtual environment
```cp ./deactivate venv/Scripts/deactivate```
4. set environment
```export FLASK_ENV=development```
5. Activate the virtual environment. (venv) in the command prompt should appear
```source venv/Scripts/activate```
6. installing the preserved packages
```pip install -r requirements.txt```


#### Run App
1. Starten Sie Python-App lokal auf Ihrem Rechner
```flask --app app.py run --host=127.0.0.1 --port=4000```
Alternativen zum Start sind: 
```flask run```, vorausgesetzt ```export FLASK_APP=app.py``` ist gesetzt
2. Testen Sie die Schnittstelle der Python-App Termine in dem Sie 
Termine setzen und Abrufen mit ```curl```.
3. Überprüfen Sie, dass die Termine in die Datei appointements.txt gespeichert werden
