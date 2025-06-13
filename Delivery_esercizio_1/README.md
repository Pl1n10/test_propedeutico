Configurazione webapp PHP + MariaDB
Questo progetto utilizza Docker Compose per avviare due servizi:

db: container MariaDB per la persistenza dei dati

web: container PHP con Apache, che si connette al database, registra data e IP degli accessi, e mostra le ultime due visite

Struttura del progetto
html/: contiene il codice PHP dell’applicazione

docker-compose.yml: definisce i servizi

.env: contiene i parametri di configurazione del database

Jenkinsfile: automatizza la build e il push dell'immagine web

deploy.yml: playbook Ansible per il deploy remoto

Scelte tecniche
È stato usato php:8.2-apache per semplicità, stabilità e integrazione immediata tra PHP e Apache. Il database è MariaDB. Il file .env gestisce le credenziali e i parametri principali.

Requisiti
Docker e Docker Compose installati

(facoltativo) Jenkins per build e deploy automatizzato

(facoltativo) Ansible per il deploy remoto

Esecuzione locale (dry run)
Clonare il repository:
git clone https://github.com/Pl1n10/test_propedeutico.git
cd test_propedeutico/Delivery_esercizio_1
Creare un file .env partendo da .env.example (o definire le variabili in shell):

DB_NAME=webapp
DB_USER=webuser
DB_PASSWORD=secret
DB_ROOT_PASSWORD=rootpass

docker compose up -d

Aprire il browser su http://localhost:8085

Jenkins
Il file Jenkinsfile automatizza:

Clonazione del repository da GitHub

Build dell’immagine del servizio web

Push su Docker Hub nel repository plini0/webapp:latest

Ansible
Il playbook deploy.yml automatizza il deploy remoto:

Verifica che Docker e Git siano presenti

Avvia Docker

Clona il repository

Copia il progetto in /opt/app

Genera .env da template

Avvia i container con docker compose

Per eseguire il deploy:

ansible-playbook deploy.yml --ask-vault-pass

Le variabili d’ambiente usate sono:

DB_NAME	Nome del database
DB_USER	Utente del database
DB_PASSWORD	Password dell’utente
DB_ROOT_PASSWOR	Password dell’utente root
