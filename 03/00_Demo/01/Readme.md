## Test app before deploying
### How to create python virtual environment
1. Create virtual environment for python
```
python -m venv venv
```
2. Activate virtual environment for python
```
source venv/Scripts/activate
(venv)
```
3. Create deactivation shell script because it's not working per default
```
cp activate deactivate.sh
# then remove all lines starting from line 40
```
4. Deactivate virtual environment for python
```
source myenv/Scripts/deactivate.sh
```

### How to start application
1. Activate virtual environment for python
2. pip install -r requirements.txt
3. python -m flask run --host=0.0.0.0