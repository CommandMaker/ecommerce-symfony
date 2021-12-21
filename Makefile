userid := $(shell id -u)
groupid := $(shell id -g)
dc := USER_ID=$(userid) GROUP_ID=$(groupid) docker-compose
de := USER_ID=$(userid) GROUP_ID=$(groupid) docker-compose exec
RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))

# Lance le serveur de développement
.PHONY: up
dev:
	@chmod +x bin/console
	@chmod +x bin/phpunit
	@$(dc) build
	@$(dc) up

# Installe les dépendances Composer
.PHONY: composer-install
composer-install:
	@$(de) php composer install

# Permet de require un paquet Composer
.PHONY: composer-require
composer-require:
	@$(de) php composer require $(RUN_ARGS)

# Permet de require un paquet Composer en mode dépendances de développement
.PHONY: composer-require-dev
composer-require-dev:
	@$(de) php composer require $(RUN_ARGS) --dev

# Remplis la base de donnée
.PHONY: seed
seed:
	@$(de) php bin/console doctrine:migrations:migrate -q
	@$(de) php bin/console doctrine:fixtures:load -q

# Met à jour les schémas de la base de donnée
.PHONY: update-schemas
update-schemas:
	@$(de) php bin/console doctrine:schema:update --force

# Crée la base de donnée
.PHONY: create-db
create-db:
	@$(de) php bin/console doctrine:database:create

# Génère une nouvelle migration
.PHONY: migration
migration:
	@$(de) php bin/console make:migration

# Migre la base de donnée
.PHONY: migrate
migrate:
	@$(de) php bin/console doctrine:migrations:migrate