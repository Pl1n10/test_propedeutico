# Docker & Ansible
Questo progetto è una configurazione Docker Compose con due servizi:

db: container MySQL per i dati
web: container PHP con Apache che si connette al database, registra gli accessi con data e IP, e mostra le ultime due visite

Scelte tecniche
Ho usato php:8.2-apache perché è pratico - ha già PHP e Apache configurati insieme, è stabile e non richiede setup particolari.
Il progetto usa un file .env per i parametri del database.
