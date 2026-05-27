### Aufgabe: App als Container publizieren
1. Erstellen Sie auf Basis eines Dockerfiles ein Image mit
   1. Ubuntu 18.04, welches gleich ohne Bestätigung das Betriebssystem updated,
   ```python-pip python-dev curl``` installiert und die Installationsdateien danach löscht
   2. das Verzeichnis ```deploy``` ins Verzeichnis ```index``` kopiert 
   3. das Verzeichnis ```index``` zum Arbeitsverzeichnis definiert
   4. die Pakete für die App installiert
2. Zusätzlich soll im Intervall von 10s die App aufgerufen und überprüft werden, 
ob diese weiterhin online ist. Falls nicht, soll der Container mit Code 1 verlassen werden und der Container umgehend neu gestartet werden. 
3. Als Tagname beim Build-Kommando wählen Sie Ihren Nachnamen oder Kurzfassung davon.
