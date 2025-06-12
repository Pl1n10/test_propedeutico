Questo progetto è una configurazione Docker Compose con due servizi:

db: container MariaDB per i dati 
web: container PHP con Apache che si connette al database, registra gli accessi con data e IP, e mostra le ultime due visite

Scelte tecniche 
Ho usato php:8.2-apache perché è pratico - ha già PHP e Apache configurati insieme, è stabile e non richiede setup particolari. 
Il progetto usa un file .env per i parametri del database.

La cartella html/ contiene il codice PHP dell’applicazione. 
I dati vengono salvati su MariaDB in una tabella visite.

È presente un file docker-compose.yml per avviare i container. 
Con il comando docker-compose up -d si avviano i servizi e l'applicazione è disponibile su localhost:8085.

È stato configurato un Jenkinsfile che automatizza la build dell'immagine del container web e la pubblicazione su Docker Hub.

Il Jenkinsfile esegue i seguenti passaggi:

1 Clona il repository da GitHub
2 Costruisce l'immagine Docker a partire dalla cartella Delivery_esercizio_1
3 Effettua il push dell'immagine su Docker Hub nel repository plini0/webapp con il tag latest

Il file .env contiene le credenziali del database. 
La connessione tra PHP e il database è definita all’interno del codice PHP.
