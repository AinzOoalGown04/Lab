#!/bin/bash

# Vérification si l'utilisateur a les droits sudo
if [ "$(id -u)" -ne 0 ]; then
    echo "Ce script doit être exécuté avec des privilèges sudo." 
    exit 1
fi

# Mettre à jour le système
echo "Mise à jour du système..."
apt update && apt upgrade -y

# Installer les dépendances nécessaires pour Docker
echo "Installation des dépendances Docker..."
apt install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Ajouter la clé GPG officielle de Docker
echo "Ajout de la clé GPG officielle de Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Ajouter le dépôt Docker
echo "Ajout du dépôt Docker..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Mettre à jour les index des paquets après ajout du dépôt Docker
echo "Mise à jour des paquets..."
apt update

# Installer Docker
echo "Installation de Docker..."
apt install -y docker-ce docker-ce-cli containerd.io

# Vérification de l'installation de Docker
echo "Vérification de l'installation de Docker..."
docker --version

# Ajouter l'utilisateur courant au groupe Docker (pour éviter de toujours utiliser sudo avec docker)
echo "Ajout de l'utilisateur au groupe Docker..."
usermod -aG docker $USER

# Installer Kathara
echo "Installation de Kathara..."
cd /tmp
git clone https://github.com/TeMPOraL-Kathara/kathara.git
cd kathara
python3 setup.py install

# Vérification de l'installation de Kathara
echo "Vérification de l'installation de Kathara..."
kathara --version

# Message de fin
echo "L'installation de Docker et Kathara est terminée avec succès !"
echo "N'oubliez pas de vous déconnecter et de vous reconnecter pour que les changements de groupe Docker prennent effet."
