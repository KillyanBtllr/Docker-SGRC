# Projet Docker - La Table d'Hélène

Ce projet utilise Docker pour encapsuler l'application *La Table d'Hélène* et ses dépendances afin de faciliter son déploiement et son exécution sur n'importe quelle machine.

## 1. Architecture Docker

Le projet repose sur une architecture Docker multi-conteneurs définie via `docker-compose.yml`. Il utilise plusieurs **Dockerfile** pour une configuration avancée.

### Conteneurs utilisés

1. **PHP-Apache** : Contient l'application PHP et le serveur Apache.
2. **MariaDB** : Base de données MySQL compatible.
3. **phpMyAdmin** : Interface web pour gérer la base de données.
4. **Redis** : Cache en mémoire pour accélérer les performances et gérer les sessions.

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
2. Copiez le fichier d'environnement et configurez les variables si nécessaire :
   ```bash
   cp .env.example .env
   ```
3. Lancez les conteneurs :
   ```bash
   docker-compose up -d
   ```

### Accéder aux services

- **Application** : `http://localhost:8080`
- **phpMyAdmin** : `http://localhost:8081` (login : `root`, mot de passe : `root`)

### Arrêter et nettoyer les conteneurs

```bash
docker-compose down -v
```

## 3. Dépannage et tests

### Vérifier les logs des conteneurs
```bash
docker logs nom_du_conteneur
```

### Vérifier si Redis fonctionne
```bash
docker exec -it sgrc_redis_1 redis-cli
PING  # Doit répondre "PONG"
```

---

Ce projet Docker permet un déploiement simple, modulaire et performant de l'application *La Table d'Hélène*, tout en exploitant Redis et MariaDB pour optimiser les performances.

