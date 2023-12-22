### Bash App for Clean-Update and System-Infos Linux

# Script de Maintenance et de Diagnostic Système

Ce script bash offre une interface pour exécuter une variété de sous-scripts qui effectuent des tâches de nettoyage, de diagnostic et d'information sur le système et le réseau.

## Fonctionnalités

Le script affiche un menu avec plusieurs options, chacune correspondant à un sous-script différent :

1. **CLEAN-SCRIPT** : Nettoie le système.
2. **CLEAN-SCRIPT-FAST** : Nettoyage rapide du système.
3. **CLEAN-SCRIPT-VM** : Nettoyage spécifique pour les machines virtuelles.
4. **CLEAN-SCRIPT-ENG** : Version anglaise du script de nettoyage.
5. **CLEAN-SCRIPT-FAST-ENG** : Version anglaise du script de nettoyage rapide.
6. **BOOT-SEQUENCE-CHECK** : Vérifie la séquence de démarrage.
7. **CHECK-NETWORK** : Diagnostique les problèmes de réseau.
8. **HARDWARE-INFOS** : Affiche les informations matérielles.
9. **SYSTEM-INFOS** : Affiche les informations système.
0. **EXIT** : Quitte le script.

## Vérification des Droits Utilisateur

Le script vérifie si l'utilisateur a les droits nécessaires (sudo) pour exécuter les sous-scripts. S'ils ne sont pas présents, un message d'erreur s'affiche et le script s'arrête.

## Mise en Forme du Texte

Des fonctions et variables de couleur sont utilisées pour améliorer la lisibilité des messages :

- Fonctions `ColorGreen` et `ColorRed` pour afficher les textes en vert et rouge respectivement.
- Variables `green`, `red`, et `clear` pour définir les codes de couleur.

## Menu Interactif

Le script utilise une structure de menu pour permettre à l'utilisateur de choisir parmi les différentes options. Chaque option lance un sous-script différent.

## Licence

Le script est distribué sous la GNU General Public License, version 3 ou ultérieure.

## Utilisation

Pour utiliser ce script, assurez-vous qu'il est exécutable :

```bash
chmod +x nom_du_script.sh
