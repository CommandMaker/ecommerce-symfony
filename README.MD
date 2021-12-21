# E-commerce Symfony

Ce site permet de montrer un exemple de réalisation d'un site complet avec Symfony 6 à travers la création d'un site web
de e-commerce. Une partie du style est réalisé avec [Bulma](https://bulma.io) et une autre par moi-même.\
Il n'est en aucun cas possible de reprendre ce site afin de s'en servir pour la réalisation d'un vrai e-commerce

## Démo

Pour l'instant, aucune démo n'est disponible, faute d'hébergeur.

## Version de développement

Vous pouvez quand même le tester en lançant la version de développement.\
Pour cela vous devez avoir [Docker](https://docker.com), puis lancez la commande suivante :

```bash
make dev
```
Lors du premier lancement, lancez les commandes suivantes
```bash
# Installer les dépendances Composer
make composer-install

# Créé la base de donnée
make create-db

# Remplis la base de donnée
make seed
```

Toutes les commandes du `Makefile` sont documentées.

Puis rendez vous sur `http://localhost:8000`. (L'interface phpMyAdmin est disponible sur le port `8080` et MailHog
sur `1080`).

### Base de donnée

Lorsque vous vous rendez sur le site vous pouvez tomber sur des erreurs SQL: dans ce cas la vérifiez que la base de
donnée existe. Pour ça, lancez la commande `make create-db` puis `make seed` afin de remplir la base avec de fausses données

Pour générer une migration Symfony, lancez
```bash
make migration
```

Pour migrer, lancez
```bash
make migrate
```

### Création de compte sur le site
Lorsque vous créez un compte sur le site, l'email ne vous parviendra pas mais sera visible sur le panel MailHog (http://localhost:1080)
