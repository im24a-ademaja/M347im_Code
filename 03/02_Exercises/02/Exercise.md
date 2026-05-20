### Aufgabe: App lokal starten und testen
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


#### Run index
1. Starten Sie Python-App lokal auf Ihrem Rechner
```flask --app app.py run``` ohne Host- und Port-Angabe
```flask --app app.py run --host=127.0.0.1 --port=4000```
```flask run```, vorausgesetzt ```export FLASK_APP=app.py``` ist gesetzt
2. Testen Sie die Schnittstelle der Python-App anhand eines selbsterstellten 
Bash-Scripts lokal auf Ihrem Rechner.
