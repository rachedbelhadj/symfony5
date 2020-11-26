#install docker
docker-dev: docker-dev-up-build docker-dev-clear-cache docker-dev-reload-data docker-dev-restart

docker-dev-up-build:
	docker-compose up -d --build
docker-dev-build:
	docker-compose build

docker-dev-clean:
	docker-compose down

docker-dev-reload:
	docker-compose up -d

docker-dev-restart: docker-dev-stop docker-dev-start

docker-dev-stop:
	docker-compose stop

docker-dev-start:
	docker-compose up -d

#docker-dev-shell:
#	docker-compose exec php bash

docker-dev-clear-cache:
	docker-compose exec php make clear-cache

docker-dev-reload-data:
	docker-compose exec php make reload-data

docker-dev-clean-cache:
	docker-compose exec php make clean-cache

#fixtures:
#	php bin/console doctrine:fixtures:load

database:
	php bin/console doctrine:schema:update --force

clean-cache:
	if [ -d /var/cache ]; then rm -rf var/cache; fi

reload-data: clean-cache database

docker-dev-composer-update:
	docker-compose exec php make composer-update

docker-dev-composer-install:
	docker-compose exec php make composer-install

composer-install:
	composer install

composer-update:
	composer update