### To run locally

* Install Vagrant, create VM & ssh into it
````shell
vagrant up
vagrant ssh
````

* Build & run docker containers
````shell
cd /drawclash
docker-compose build
docker-compose run web /drawclash/bin/setup
docker-compose up
````

* Access application via http://localhost:3000
