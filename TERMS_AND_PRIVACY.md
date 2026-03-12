# TohyNet — Conditions d'utilisation & Politique de confidentialité
# TohyNet — Terms of Service and Privacy Policy

**Version :** 1.0  
**Date d'entrée en vigueur / Effective Date :** 12 mars 2026 / March 12, 2026  
**Auteur / Author :** Rakotonirina Tahinjanahary Gilbert Roland  
**Contact :** [github.com/Rakotonirina-Tahina](https://github.com/Rakotonirina-Tahina)

---

## 🇫🇷 CONDITIONS D'UTILISATION (CGU)

### 1. Acceptation des conditions

En téléchargeant, installant ou utilisant le logiciel **TohyNet**, vous acceptez d'être lié(e) par les présentes Conditions d'utilisation. Si vous n'acceptez pas ces conditions, vous ne devez pas utiliser ce logiciel.

### 2. Propriété intellectuelle

TohyNet est un logiciel **propriétaire gratuit** (*freeware*). Il est distribué gratuitement mais **n'est pas open source**. Tous les droits, titres et intérêts relatifs au logiciel, y compris le code source, les interfaces et la documentation, restent la propriété exclusive de **Rakotonirina Tahinjanahary Gilbert Roland**.

Il est **strictement interdit** de :
- Copier, modifier, décompiler, désassembler ou tenter d'extraire le code source du logiciel.
- Distribuer, revendre, louer, prêter ou sous-licencier le logiciel à des tiers.
- Créer des œuvres dérivées basées sur le logiciel.
- Retirer ou modifier les mentions de propriété intellectuelle ou de droit d'auteur.

### 3. Utilisation autorisée

L'utilisation de TohyNet est autorisée **uniquement** à des fins :
- Personnelles et non commerciales.
- Légales, dans le respect des lois et réglementations en vigueur.
- Conformes aux politiques d'utilisation acceptable des réseaux concernés.

### 4. Utilisation responsable du réseau

TohyNet est un outil de gestion réseau. L'utilisateur est **seul responsable** de l'usage qu'il en fait. Il est **interdit** d'utiliser ce logiciel pour :
- Accéder sans autorisation à des réseaux WiFi tiers.
- Intercepter, analyser ou modifier le trafic réseau d'autrui sans consentement.
- Mener des attaques informatiques, du déni de service (DoS) ou toute activité malveillante.
- Violer les lois sur la cybersécurité, la vie privée ou les communications électroniques.

### 5. Permissions système requises

TohyNet requiert des droits d'administration (`sudo`) pour fonctionner. En accordant ces permissions, vous reconnaissez comprendre les risques associés et assumez l'entière responsabilité des modifications apportées à votre système.

### 6. Exclusion de garantie

Le logiciel est fourni **« tel quel »**, sans garantie d'aucune sorte, expresse ou implicite. L'auteur ne garantit pas que le logiciel sera exempt d'erreurs, ininterrompu, ou adapté à un usage particulier.

### 7. Limitation de responsabilité

En aucun cas, l'auteur ne pourra être tenu responsable de dommages directs, indirects, accessoires, spéciaux ou consécutifs résultant de l'utilisation ou de l'impossibilité d'utiliser le logiciel, même si l'auteur a été informé de la possibilité de tels dommages.

### 8. Mises à jour des conditions

L'auteur se réserve le droit de modifier ces conditions à tout moment. Les modifications prennent effet dès leur publication. L'utilisation continue du logiciel après modification vaut acceptation des nouvelles conditions.

### 9. Droit applicable

Les présentes conditions sont régies par le droit en vigueur dans le pays de résidence de l'auteur. Tout litige sera soumis aux tribunaux compétents.

---

## 🇫🇷 POLITIQUE DE CONFIDENTIALITÉ

### 1. Données collectées

TohyNet fonctionne **localement** sur votre machine. Le logiciel **ne collecte pas, ne transmet pas et ne vend pas** vos données personnelles à des serveurs tiers.

Les données stockées localement dans `~/.tohynet/` incluent :
- **`state.json`** : configuration de votre hotspot (SSID, interface réseau, méthode)
- **`blocked.json`** : adresses MAC et IP des clients gérés
- **`dnsmasq.leases`** : baux DHCP des clients connectés
- **`dnsmasq.log`** : logs réseau locaux
- **`tos_accepted`** : fichier témoin d'acceptation des CGU

### 2. Utilisation des données locales

Ces données sont utilisées exclusivement pour :
- Mémoriser la configuration entre les sessions
- Appliquer les règles de blocage et de limitation de débit
- Afficher l'historique des clients connectés

### 3. Partage des données

Aucune donnée n'est envoyée à des serveurs distants. TohyNet ne contient aucun mécanisme de télémétrie, de collecte de statistiques ou de rapport vers l'extérieur.

### 4. Suppression des données

Pour supprimer toutes les données locales, supprimez le répertoire `~/.tohynet/` :
```bash
rm -rf ~/.tohynet/
```

### 5. Droits réseaux tiers

TohyNet utilise les adresses MAC et IP des appareils qui se connectent à votre hotspot. Ces données restent sur votre machine et ne sont pas partagées.

---

## 🇬🇧 TERMS OF SERVICE

### 1. Acceptance of Terms

By downloading, installing, or using **TohyNet**, you agree to be bound by these Terms of Service. If you do not agree, you must not use this software.

### 2. Intellectual Property

TohyNet is **proprietary freeware**. It is distributed free of charge but is **not open source**. All rights, title, and interest in the software, including source code, interfaces, and documentation, remain the exclusive property of **Rakotonirina Tahinjanahary Gilbert Roland**.

It is **strictly prohibited** to:
- Copy, modify, decompile, disassemble, or attempt to extract the source code.
- Distribute, resell, rent, lend, or sublicense the software to third parties.
- Create derivative works based on the software.
- Remove or alter intellectual property or copyright notices.

### 3. Permitted Use

Use of TohyNet is permitted **only** for:
- Personal, non-commercial purposes.
- Lawful activities compliant with applicable laws and regulations.
- Activities compliant with the acceptable use policies of the networks involved.

### 4. Responsible Network Use

TohyNet is a network management tool. The user is **solely responsible** for their use of it. It is **forbidden** to use this software to:
- Access third-party WiFi networks without authorization.
- Intercept, analyze, or modify others' network traffic without consent.
- Conduct cyberattacks, denial-of-service (DoS) attacks, or any malicious activity.
- Violate cybersecurity, privacy, or electronic communications laws.

### 5. System Permissions

TohyNet requires administrator rights (`sudo`) to function. By granting these permissions, you acknowledge understanding the associated risks and assume full responsibility for any changes made to your system.

### 6. Disclaimer of Warranties

The software is provided **"as is"**, without warranty of any kind, express or implied. The author does not warrant that the software will be error-free, uninterrupted, or fit for a particular purpose.

### 7. Limitation of Liability

In no event shall the author be liable for any direct, indirect, incidental, special, or consequential damages arising from the use or inability to use the software.

### 8. Changes to Terms

The author reserves the right to modify these terms at any time. Changes take effect upon publication. Continued use of the software after modification constitutes acceptance of the new terms.

### 9. Governing Law

These terms are governed by the laws applicable in the author's country of residence.

---

## 🇬🇧 PRIVACY POLICY

### 1. Data Collected

TohyNet runs **locally** on your machine. The software **does not collect, transmit, or sell** your personal data to third-party servers.

Data stored locally in `~/.tohynet/` includes:
- **`state.json`**: hotspot configuration (SSID, network interface, method)
- **`blocked.json`**: MAC and IP addresses of managed clients
- **`dnsmasq.leases`**: DHCP leases of connected clients
- **`dnsmasq.log`**: local network logs
- **`tos_accepted`**: Terms of Service acceptance record

### 2. Use of Local Data

This data is used exclusively to:
- Remember configuration between sessions
- Apply blocking and bandwidth limiting rules
- Display connected client history

### 3. Data Sharing

No data is sent to remote servers. TohyNet contains no telemetry, statistics collection, or outbound reporting mechanisms.

### 4. Data Deletion

To delete all local data, remove the `~/.tohynet/` directory:
```bash
rm -rf ~/.tohynet/
```

### 5. Third-Party Network Rights

TohyNet uses MAC and IP addresses of devices connecting to your hotspot. This data remains on your machine and is not shared.

---

*© 2026 Rakotonirina Tahinjanahary Gilbert Roland  — Tous droits réservés / All rights reserved.*  
*TohyNet est un logiciel propriétaire gratuit. / TohyNet is proprietary freeware.*
