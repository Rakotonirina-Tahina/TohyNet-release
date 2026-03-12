# 🌐 TohyNet

> **Connectez-vous au WiFi et partagez simultanément la connexion sous Linux**  
> Interface graphique (GUI) + mode texte (TUI) — Design Cyberpunk Terminal

---

## 🚀 Installation rapide

> ⚠️ **Ce dépôt contient le code source.** Il requiert Python 3 + les dépendances.  
> Pour une installation simple **sans Python**, téléchargez plutôt le **binaire précompilé** :
> 🔗 [github.com/Rakotonirina-Tahina/TohyNet-release](https://github.com/Rakotonirina-Tahina/TohyNet-release)

```bash
# 1. Cloner ce dépôt source
git clone https://github.com/Rakotonirina-Tahina/TohyNet.git
cd TohyNet

# 2. Installer les dépendances système et le lanceur Python
chmod +x install.sh
sudo ./install.sh

# 3. Lancer TohyNet
tohynet
```

---

## 📋 Fonctionnalités

| Fonction | Description |
|---|---|
| 📶 Scanner WiFi | Affiche tous les réseaux disponibles avec signal et sécurité |
| 🔗 Se connecter | Connexion à n'importe quel réseau WiFi protégé ou ouvert |
| 📡 Créer un hotspot | Partage la connexion via un point d'accès WiFi |
| 👥 Voir les clients | Liste les appareils connectés au hotspot |
| 🚫 Bloquer un client | Bloque un appareil indésirable par adresse MAC |
| ⚡ Limiter le débit | Applique une limite de bande passante par appareil (`tc`) |
| 🔧 Diagnostics | Tests de connectivité et de résolution DNS |

---

## 🛠 Prérequis

L'installateur gère tout automatiquement. Voici les dépendances requises :

| Paquet | Rôle |
|---|---|
| `python3` + `python3-tk` | Moteur du programme + interface graphique |
| `network-manager` (`nmcli`) | Gestionnaire de réseau |
| `hostapd` | Création du point d'accès WiFi |
| `dnsmasq` | Attribution DHCP des IP aux clients |
| `iw` / `wireless-tools` | Outils WiFi bas-niveau |
| `iptables` | Partage de connexion (NAT / IP forwarding) |

---

## 💡 Utilisation

### Connexion WiFi

```
Menu → Scanner et se connecter au WiFi
→ Liste des réseaux disponibles
→ Choisir le numéro du réseau
→ Entrer le mot de passe
```

### Créer un hotspot

```
Menu → Gérer le Hotspot
→ Entrer le nom du hotspot (SSID)
→ Entrer un mot de passe (min. 8 caractères)
→ Choisir la méthode :
   • NetworkManager (recommandé — 1 interface WiFi)
   • hostapd (avancé — 2 interfaces WiFi)
```

---

## 🔧 Méthodes de création du hotspot

### Méthode 1 : NetworkManager (recommandée)

- Utilise une seule interface WiFi (si elle supporte le mode AP simultané)
- Simple et intégrée au système
- Fonctionne sur la plupart des cartes WiFi modernes

### Méthode 2 : hostapd + dnsmasq

- Recommandée avec **2 interfaces WiFi** (ou WiFi + clé USB WiFi)
- Plus de contrôle et de configuration
- Idéale pour les adaptateurs WiFi USB comme second point d'accès

---

## 📂 Fichiers installés

| Chemin | Description |
|---|---|
| `/usr/local/bin/tohynet` | Commande principale |
| `/etc/sudoers.d/tohynet` | Permissions réseau sans mot de passe |
| `~/.tohynet/` | Répertoire de configuration et logs |

---

## 🐛 Dépannage

**Le hotspot ne démarre pas ?**
```bash
iw list | grep "Supported interface modes" -A 10
# Chercher "AP" dans la liste — si absent, utilisez une clé WiFi USB
```

**Pas d'internet sur les clients ?**
```bash
cat /proc/sys/net/ipv4/ip_forward   # doit afficher 1
sudo iptables -t nat -L             # vérifier la règle MASQUERADE
```

**NetworkManager bloque le hotspot ?**
```bash
sudo systemctl stop NetworkManager
# Relancer TohyNet, puis :
sudo systemctl start NetworkManager
```

**tkinter absent (mode TUI uniquement) ?**
```bash
sudo apt-get install python3-tk
```

---

## 📄 Licence & Conditions d'utilisation

TohyNet est un **logiciel propriétaire gratuit (freeware)**.  
Il est distribué **gratuitement** mais **n'est pas open source**.

- ✅ Utilisation personnelle gratuite
- ❌ Modification, décompilation ou redistribution **interdites**
- ❌ Utilisation commerciale **interdite**

Lors du premier lancement, vous devrez **lire et accepter** les Conditions d'utilisation et la Politique de confidentialité.

> 📜 Texte complet : [TERMS_AND_PRIVACY.md](./TERMS_AND_PRIVACY.md)

© 2026 TohyNet — Tous droits réservés

---

## 📦 Télécharger l'exécutable (release)

> 🔗 Les binaires compilés sont publiés dans le dépôt dédié :  
> **[github.com/Rakotonirina-Tahina/TohyNet-release](https://github.com/Rakotonirina-Tahina/TohyNet-release)**

```bash
# Télécharger et rendre exécutable
chmod +x tohynet
./tohynet
```

---

## 🔨 Compiler soi-même (développeurs)

> ⚠ Le code source de ce dépôt est fourni à titre de référence uniquement.  
> Toute modification ou redistribution est **interdite**.

```bash
# Installer PyInstaller
pip3 install pyinstaller

# Compiler en binaire standalone
bash build.sh
# → Binaire généré dans : release/tohynet
```

---
