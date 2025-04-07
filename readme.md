# Projet Docker - La Table d'Hélène

Ce projet utilise Docker pour encapsuler l'application *La Table d'Hélène* et ses dépendances afin de faciliter son déploiement et son exécution sur n'importe quelle machine.

## 1. Architecture Docker

Le projet repose sur une architecture Docker multi-conteneurs définie via `docker-compose.yml` qui utilise plusieurs **Dockerfile** pour une configuration avancée.

### Conteneurs utilisés

1. **PHP-Apache** : Contient l'application PHP et le serveur Apache.
2. **MariaDB** : Base de données MySQL compatible.
3. **Redis** : Cache en mémoire pour accélérer les performances et gérer les sessions. Utilisation de la version Alpine pour optimiser le poids de l'image

### Complexité de la configuration

- **Dockerfile personnalisés** : Chaque service a son propre `Dockerfile`, permettant une meilleure modularité et optimisation.
- **Variables d'environnement** : Utilisation de `.env` pour définir les paramètres de connexion (évite de hardcoder les informations sensibles).
- **Volumes persistants** : Empêche la perte de données à chaque redémarrage du conteneur.
- **Configuration avancée avec Entrypoint** : Certains conteneurs utilisent un script `entrypoint.sh` pour exécuter des configurations à l'initialisation.

## 2. Installation et utilisation

### Prérequis

- **Docker** (version 27.2.0 minimum recommandée)
- **Docker Compose** (version 2.29.2 recommandée)

### Installation

1. Clonez le projet :
   ```bash
   git clone https://github.com/KillyanBtllr/docker-sgrc.git
   cd sgrc
   ```
2. Lancez les conteneurs :
   ```bash
   docker compose up
   ```

### Accéder aux services

- **Application** : `http://localhost:8080`

### Arrêter et nettoyer les conteneurs

```bash
docker compose down
```

## 3. Dépannage et tests

### Vérifier les logs des conteneurs
```bash
docker logs web
```
```bash
docker logs db
```
```bash
docker logs redis
```


---

Ce projet Docker permet un déploiement simple, modulaire et performant de l'application *La Table d'Hélène*, tout en exploitant MariaDB pour gérer la persistance des données et Redis pour optimiser les performances.

