#!/bin/bash
set -e

echo "📂 Vérification des permissions sur /var/www/html..."
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

echo "🔍 Vérification de la disponibilité de la base de données..."

until nc -z -v -w30 $DATABASE_HOST 3306; do
  echo "⏳ En attente de la base de données sur $DATABASE_HOST:3306..."
  sleep 2
done
echo "✅ La base de données est prête !"

echo "🚀 Lancement d'Apache..."
exec "$@"