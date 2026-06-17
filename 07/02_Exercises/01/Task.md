### Aufgabe 1: Taskmanager mit Persistenz-Schicht
#### Voraussetzung
1. Task-Manager aus 07/01_Intro/01 basierend auf Python3 und Flask
2. MongoDB (lokal oder auf Atlas)
#### Gesucht
1. Task-Manager mit Persistenz (Storage) Layer in MongoDB.
Verwenden Sie dazu die Abhängigkeiten 
``` 
Flask
pymongo
dnspython
```
2. Starten und testen Sie den Taskmanager mit der Storage-Layer 

Beispiel Task erzeugen, auflisten und löschen (hier mit einem Testscript):
```
$ ./test.sh                                             
Post task Kauf Milch, Hochpast 2L in der Migros         
                                                        
{                                                       
  "description": "Hochpast 2L in der Migros",           
  "id": "6848a21e594b9eb334024d8b",                     
  "status": "pending",                                  
  "title": "Kauf Milch"                                 
}                                                       
Show all tasks                                          
[                                                       
  {                                                     
    "description": "Hochpast 2L in der Migros",         
    "id": "68489c95594b9eb334024d89",                   
    "status": "pending",                                
    "title": "Kauf Milch"                               
  },                                                    
  {                                                     
    "description": "Universalmehl von Schär, Körner dazu mixen",         
    "id": "6848a19a594b9eb334024d8a",                   
    "status": "pending",                                
    "title": "Glutenfreies Brot backen"                               
  },                                                    
  {                                                     
    "description": "Exercise xy erledigen",         
    "id": "6848a21e594b9eb334024d8b",                   
    "status": "pending",                                
    "title": "Hausaufgaben für Modul 347"                               
  }                                                     
]                                                       
Get task with id=68489c95594b9eb334024d89{              
  "description": "Hochpast 2L in der Migros",           
  "id": "68489c95594b9eb334024d89",                     
  "status": "pending",                                  
  "title": "Kauf Milch"                                 
}                                                       
Now deleting task with id=68489c95594b9eb334024d89{     
  "message": "Task 68489c95594b9eb334024d89 deleted"    
}
```                                                  