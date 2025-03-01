#!/bin/bash

# Nom d'utilisateur Docker Hub
DOCKER_USER="odjohfrejus"

# Vérifier si jq est installé
if ! command -v jq &> /dev/null; then
    echo "Erreur : jq n'est pas installé. Installe-le avec : sudo apt install jq"
    exit 1
fi

# Initialiser la pagination
PAGE=1

echo "🔍 Récupération des dépôts de $DOCKER_USER sur Docker Hub..."

# Boucle pour récupérer toutes les pages de l'API Docker Hub
while true; do
    # Récupérer la liste des dépôts avec pagination
    RESPONSE=$(curl -s "https://hub.docker.com/v2/repositories/$DOCKER_USER/?page=$PAGE&page_size=100")
    
    # Extraire les noms des dépôts
    REPOS=$(echo "$RESPONSE" | jq -r '.results[].name')
    
    # Si plus de dépôts disponibles, on arrête la boucle
    if [ -z "$REPOS" ]; then
        break
    fi
    
    # Télécharger toutes les images
    for REPO in $REPOS; do
        IMAGE="$DOCKER_USER/$REPO"
        echo "📥 Pulling image: $IMAGE..."
        docker pull $IMAGE
    done

    # Vérifier s'il y a une autre page de résultats
    NEXT=$(echo "$RESPONSE" | jq -r '.next')
    if [ "$NEXT" == "null" ]; then
        break
    fi

    ((PAGE++))
done

echo "✅ Toutes les images de $DOCKER_USER ont été téléchargées avec succès."
