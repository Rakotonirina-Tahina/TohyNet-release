#!/bin/bash
# ╔══════════════════════════════════════════════════════════╗
# ║      TohyNet Release — Installateur binaire            ║
# ╚══════════════════════════════════════════════════════════╝

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

info()    { echo -e "${CYAN}${BOLD}[INFO]${RESET} $*"; }
success() { echo -e "${GREEN}${BOLD}[OK]${RESET}   $*"; }
warn()    { echo -e "${YELLOW}${BOLD}[WARN]${RESET} $*"; }
error()   { echo -e "${RED}${BOLD}[ERR]${RESET}  $*"; }

echo -e "${CYAN}${BOLD}"
echo "╔══════════════════════════════════════════════════════════╗"
echo "║      TohyNet Release — Installation binaire          ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "${RESET}"

# ── Vérifier root ──────────────────────────────────────────────────────────────
if [ "$EUID" -ne 0 ]; then
    error "Ce script doit être exécuté en tant que root (sudo)."
    echo "  Relancez avec: sudo $0"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_BIN="$SCRIPT_DIR/tohynet"
DEST_BIN="/usr/local/bin/tohynet"

if [ ! -f "$SRC_BIN" ]; then
    error "Binaire introuvable: $SRC_BIN"
    error "Placez ce script à côté du fichier 'tohynet' dans le repo release."
    exit 1
fi

# ── Détection de la distro ───────────────────────────────────────────────────
if [ -f /etc/debian_version ]; then
    DISTRO="debian"
    info "Distro détectée: Debian/Ubuntu"
elif [ -f /etc/arch-release ]; then
    DISTRO="arch"
    info "Distro détectée: Arch Linux"
elif [ -f /etc/fedora-release ]; then
    DISTRO="fedora"
    info "Distro détectée: Fedora/RHEL"
else
    DISTRO="unknown"
    warn "Distribution non reconnue. Installation minimale seulement."
fi

# ── Installation des dépendances système réseau (pas Python) ───────────────
info "Installation des dépendances réseau système..."
if [ "$DISTRO" = "debian" ]; then
    apt-get update -qq
    apt-get install -y network-manager hostapd dnsmasq iw wireless-tools iptables net-tools curl \
        2>/dev/null || warn "Certains paquets n'ont pas pu être installés."
elif [ "$DISTRO" = "arch" ]; then
    pacman -Sy --noconfirm networkmanager hostapd dnsmasq iw wireless_tools iptables net-tools curl \
        2>/dev/null || warn "Certains paquets n'ont pas pu être installés."
    systemctl enable --now NetworkManager 2>/dev/null || true
elif [ "$DISTRO" = "fedora" ]; then
    dnf install -y NetworkManager hostapd dnsmasq iw wireless-tools iptables net-tools curl \
        2>/dev/null || warn "Certains paquets n'ont pas pu être installés."
fi

# ── Vérification des binaires requis ─────────────────────────────────────────
info "Vérification des composants système requis..."
MISSING=()
for cmd in nmcli hostapd dnsmasq iw iptables ip sysctl; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        MISSING+=("$cmd")
    fi
done
if [ ${#MISSING[@]} -gt 0 ]; then
    warn "Composants manquants: ${MISSING[*]}"
    warn "L'application peut se lancer, mais certaines fonctions réseau échoueront."
else
    success "Tous les composants réseau requis sont présents."
fi

# ── Installer le binaire release ─────────────────────────────────────────────
info "Installation du binaire dans $DEST_BIN..."
install -m 755 "$SRC_BIN" "$DEST_BIN"
success "Binaire installé: $DEST_BIN"

# ── Sudoers pour les commandes réseau ──────────────────────────────────────────
info "Configuration des permissions sudo..."

SUDOERS_FILE="/etc/sudoers.d/tohynet"
cat > "$SUDOERS_FILE" << 'SUDOERS'
# TohyNet — permissions réseau sans mot de passe
%sudo ALL=NOPASSWD: /usr/sbin/hostapd, /usr/sbin/dnsmasq, /sbin/iptables, /sbin/ip, /usr/sbin/iw, /usr/bin/sysctl
SUDOERS

chmod 440 "$SUDOERS_FILE"
success "Permissions configurées."

# ── Activer NetworkManager ─────────────────────────────────────────────────────
info "Activation de NetworkManager..."
systemctl enable NetworkManager 2>/dev/null || true
systemctl start NetworkManager 2>/dev/null || true
success "NetworkManager actif."

# ── Désactiver hostapd au démarrage (géré par le script) ──────────────────────
systemctl disable hostapd 2>/dev/null || true
systemctl stop hostapd 2>/dev/null || true

# ── Créer raccourci bureau (si GNOME/KDE) ─────────────────────────────────────
if [ -n "$SUDO_USER" ]; then
    USER_HOME=$(eval echo "~$SUDO_USER")
    DESKTOP_DIR="$USER_HOME/Desktop"
    
    if [ -d "$DESKTOP_DIR" ]; then
        cat > "$DESKTOP_DIR/tohynet.desktop" << DESKTOP
[Desktop Entry]
Version=1.0
Type=Application
Name=TohyNet
Comment=Connectez et partagez le WiFi simultanément
Exec=/usr/local/bin/tohynet
Icon=network-wireless
Terminal=false
Categories=Network;
DESKTOP
        chmod +x "$DESKTOP_DIR/tohynet.desktop"
        chown "$SUDO_USER:$SUDO_USER" "$DESKTOP_DIR/tohynet.desktop" 2>/dev/null || true
        success "Raccourci bureau créé."
    fi
fi

# ── Résumé ─────────────────────────────────────────────────────────────────────
echo
echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════════════════╗"
echo "║      TohyNet — Installation réussie ! 🎉          ║"
echo "╚══════════════════════════════════════════════════════╝${RESET}"
echo
echo -e "  Lancez le programme avec: ${CYAN}${BOLD}tohynet${RESET}"
echo -e "  Ou avec privilèges:       ${CYAN}sudo tohynet${RESET}"
echo -e "  Binaire installé dans:    ${CYAN}/usr/local/bin/tohynet${RESET}"
echo
