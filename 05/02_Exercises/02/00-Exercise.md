### Aufgabe: Bind mounts erstellen und testen
#### Pre-requisits
Sie haben bereits ein ubuntu Image von hub.docker.com gepulled, 
um damit den ubuntu-Container zu starten.

#### Aufgabenstellung
1. Wechseln Sie in Ihr HOME und erstellen Sie ein Verzeichnis data 
2. Starten Sie einen Container con_<IhrKürzel>, wobei Sie data-Verzeichnis aus Ihrem HOME
über bind mount mit dem tmp-Verzeichnis im Container verbinden.
3. Testen Sie, ob der Container und bind mount erzeugt wurden.
4. Erstellen Sie eine leere Datei im tmp-Verzeichnis.
5. Überprüfen Sie auf Ihrem Host-Rechner, ob die Datei auch data-Verzeichnis erscheint.
6. Erstellen Sie eine weitere leere Datei im data-Verzeichnis. 
7. Überprüfen Sie im Container, ob die Datei auch tmp-Verzeichnis erscheint.
8. Löschen Sie alle erzeugten Ressourcen, um Seiteneffekte für neue Übungen zu vermeiden

