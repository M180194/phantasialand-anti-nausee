# phantasialand-anti-nausee

App Flutter — planning Phantasialand sur 2 jours, carte hors-ligne, checklists, GPS overlay.

## Déploiement rapide (si tu veux builder toi-même)
1. Installer Flutter & Android SDK
2. `git clone <ton-repo-url>`
3. `flutter pub get`
4. `flutter build apk --release`
5. Installer `build/app/outputs/flutter-apk/app-release.apk` sur ton Android

## Utiliser GitHub Actions (automatique)
1. Crée un repo GitHub public nommé `phantasialand-anti-nausee`
2. Pousse tous les fichiers (le contenu du dossier project)
3. Sur GitHub, va dans Actions → choisis le run → attends que le job termine
4. Télécharge l’APK depuis `Artifacts`

## Remarques
- Remplace `assets/phantasialand_map.png` par la vraie image haute-résolution du plan du parc.
- Pour mapping précis, fournir 3–4 points lat/lng correspondant à coins sur l’image.
