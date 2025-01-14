# Conception d’une Infrastructure Évolutive pour la Formation en Sécurité Informatique

## 📚 Description du Projet

Ce projet fait partie de mon mémoire intitulé **"Conception d’une infrastructure évolutive pour la formation en sécurité informatique"**, réalisé avec l'outil **Kathara**. L'objectif est de concevoir des infrastructures vulnérables permettant de former des utilisateurs aux concepts d'attaques et de réponses aux incidents, tout en s'alignant sur des cadres de sécurité tels que **MITRE ATT&CK**, **CAPEC**, **NIST**, et **SANS**.

---

## 🛠️ Scénarios Réalisés

### **1. Infrastructure 1 : Scénario d'Exploitation de Vulnérabilités**
**Description :**
Ce scénario met en place une infrastructure vulnérable permettant à l'utilisateur d'exploiter différentes failles de sécurité et d'effectuer des étapes d'attaque, telles que l'escalade de privilèges, l'accès à un serveur via Telnet, et la récupération de mots de passe via brute-force.

**Composition de l'infrastructure :**
- **Machines :**
  - 1 machine admin
  - 2 serveurs
  - 2 machines utilisateur
  - 1 machine attaquante (exploitant les vulnérabilités)
  - 1 routeur
- **Objectifs pédagogiques :**
  - Comprendre les concepts d'escalade de privilèges.
  - Utiliser des outils comme `Hashcat` pour le brute-force.
  - Apprendre à identifier et exploiter les services mal configurés (FTP, Telnet).

**Étapes principales alignées sur CAPEC et MITRE ATT&CK :**
1. **Accès initial** (CAPEC-100) : Exploitation des vulnérabilités des services actifs.
2. **Escalade de privilèges** (CAPEC-233) : Accès au compte administrateur via récupération de hash.
3. **Mouvement latéral** (MITRE T1077) : Exploration du réseau et recherche de nouvelles cibles.
4. **Exfiltration de données** (CAPEC-118) : Extraction de mots de passe et fichiers critiques.

---

### **2. Infrastructure 2 : Scénario de Réponse aux Incidents**
**Description :**
Ce scénario place l'utilisateur dans un contexte de réponse à un incident après la compromission d'un serveur web. L'objectif est de détecter et analyser les traces laissées par une attaque, tout en rétablissant la sécurité.

**Composition de l'infrastructure :**
- **Machines :**
  - 1 machine admin
  - 1 routeur
  - 1 serveur web compromis
- **Objectifs pédagogiques :**
  - Détecter des traces de compromission (scripts malveillants, exfiltration de données).
  - Comprendre et appliquer les méthodologies de réponse aux incidents.
  - Appliquer les standards **SANS** et **NIST**.

**Étapes principales alignées sur SANS et NIST :**
1. **Identification :** Analyse des journaux système pour détecter des activités suspectes.
2. **Confinement :** Isoler le serveur compromis pour limiter l’impact.
3. **Eradication :** Supprimer les scripts malveillants et sécuriser les accès.
4. **Rétablissement :** Restaurer le fonctionnement normal du serveur et appliquer des correctifs.
5. **Rapport :** Documentation complète des mesures prises et des vulnérabilités identifiées.

---

## 🚀 Objectifs Techniques et Pédagogiques
1. Familiariser les utilisateurs avec des outils couramment utilisés en cybersécurité :
   - **Outils d'attaque :** `nmap`, `Hashcat`, `Telnet`.
   - **Outils de réponse :** Analyse de journaux, commandes Linux, outils de diagnostic.
2. Apprendre à concevoir et analyser des infrastructures réseau sécurisées.
3. S'aligner sur les standards de sécurité (**MITRE**, **CAPEC**, **SANS**, **NIST**).
4. Encourager une approche méthodologique dans la détection et la réponse aux menaces.

---

## 📂 **Structure des Fichiers**

**/admin/** : Configuration de la machine administrateur.

**admin.startup** : Script de démarrage pour la machine administrateur.
**/daryl/** : Configuration de la machine d'attaque.

**daryl.startup** : Script de démarrage pour la machine d'attaque.
**/firewall1/** : Configuration du premier pare-feu.

**firewall1.startup** : Script de démarrage pour le pare-feu 1.
**/firewall2/**: Configuration du deuxième pare-feu.

**firewall2.startup** : Script de démarrage pour le pare-feu 2.
**/jaurel/** : Configuration de la machine Jaurel.

**jaurel.startup** : Script de démarrage pour la machine Jaurel.
**/medesse/** : Configuration de la machine Medesse.

**medesse.startup** : Script de démarrage pour la machine Medesse.
**/routeur/** : Configuration du routeur principal.

**routeur.startup** : Script de démarrage pour le routeur principal.
**/routeur1/** : Configuration du routeur 1.

**routeur1.startup** : Script de démarrage pour le routeur 1.
**/routeur2/** : Configuration du routeur 2.

**routeur2.startup** : Script de démarrage pour le routeur 2.
**/server_ftp/** : Configuration du serveur FTP.

**server_ftp.startup** : Script de démarrage pour le serveur FTP.
**/server_web/** : Configuration du serveur Web.

**server_web.startup** : Script de démarrage pour le serveur Web.
**/lab.conf** : Fichier de configuration pour l'environnement Kathara.

**/lab.conf.save** : Sauvegarde de la configuration de l'environnement.

---

## 🔗 Références Utilisées
- **MITRE ATT&CK Framework** : [https://attack.mitre.org](https://attack.mitre.org)
- **CAPEC Framework** : [https://capec.mitre.org](https://capec.mitre.org)
- **NIST** : [https://www.nist.gov](https://www.nist.gov)
- **SANS** : [https://www.sans.org](https://www.sans.org)

---

## 📋 Prérequis

- **Outils nécessaires :**
  - Kathara (pour simuler les infrastructures réseau)
  - Docker (si requis par Kathara)
  - Un environnement Linux ou Windows avec Git installé
  - jq (pour t'aider à pull les images nécessaires)

- **Installation de Kathara :**
  Consultez la [documentation officielle de Kathara](https://www.kathara.org/) pour l'installation.

---

## 🧑‍💻 Comment Exécuter les Scénarios
1. Clonez ce dépôt :
   ```bash
   git clone https://github.com/AinzOoalGown04/Lab.git
   cd Lab
2. Téléchargez les images nécessaires depuis Docker Hub. Les images sont disponibles sous l'utilisateur odjohfrejus, pour t'aider j'ai préparé le script pull_images.sh.
Donc pour commencer, tu dois installer jq. C'est un petit outil super pratique pour manipuler des fichiers JSON. C'est vraiment simple à installer. Lance cette commande dans ton terminal :

sudo apt-get install jq

Ensuite, il te faut un script pour télécharger les images Docker automatiquement. Tu peux le sauvegarder sous un nom comme pull_images.sh. Une fois que tu l'as sauvegardé, il faut lui donner les droits d'exécution avec cette commande :

chmod +x pull_images.sh

Et voilà, ton script est prêt à être exécuté ! Il te suffit de le lancer avec :

./pull_images.sh

Ça va récupérer toutes les images Docker nécessaires et les installer tranquillement.

3. Fais un cd sur le dossier du lab que tu veux executer puis fais kathara lstart, et ton lab va se lancer!!

4.Enjoy your hack!!
