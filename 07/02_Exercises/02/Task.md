### Aufgabe 2: Taskmanager mit Persistenz-Schicht mit Containern
#### Voraussetzung
1. Task-Manager aus Exercise 07/02_Exercises/01
2. MongoDB (lokal oder auf Atlas)
#### Gesucht
1. Task-Manager mit Flask, MongoDB, wobei die Anwendung mit Docker Compose gestartet und betrieben wird.
* Container 1: Flask REST API (Python app)
* Container 2: MongoDB instance
* Docker Compose verbindet die beiden Container über das Default-Netzwerk

Vorschlage für die Projekt-Struktur:
```
task-manager/
├── deploy/
│   ├── task_manager.py
│   ├── requirements.txt
├── docker-compose.yml
├── Dockerfile
```

2. Starten und testen Sie den Taskmanager als Multi-Container. 
Beispiel mit einem Testscript: 
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
    "description": "Ruchbrot BIO in der Migros",         
    "id": "6848a19a594b9eb334024d8a",                   
    "status": "pending",                                
    "title": "Kauf Brot"                               
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