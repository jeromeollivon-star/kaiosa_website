# KAIOSA Website - Application Flutter

Site web de KAIOSA converti en application Flutter moderne et responsive.

## 🎯 Caractéristiques

- ✅ Design moderne et responsive
- ✅ Navigation fluide entre les sections
- ✅ Animations élégantes
- ✅ Compatible web, mobile et desktop
- ✅ Architecture claire et maintenable

## 📱 Sections

1. **Accueil** - Philosophie et méthode KAIOSA
2. **Kaiosa ?** - Origine du nom inspiré de Kaio-sama (Dragon Ball Z)
3. **À propos** - Présentation de Jérôme Ollivon et son expertise
4. **Services** - Offres de prototypage, conseil et accompagnement
5. **Réalisations** - Portfolio de projets concrets
6. **Contact** - Formulaire de contact et informations

## 🚀 Installation et Lancement

### Prérequis

- Flutter SDK (version 3.0.0 ou supérieure)
- Un éditeur de code (VS Code, Android Studio, etc.)

### Installation

```bash
# Cloner ou télécharger le projet
cd kaiosa_website

# Installer les dépendances
flutter pub get
```

### Lancement en mode développement

```bash
# Pour le web
flutter run -d chrome

# Pour mobile (avec émulateur lancé)
flutter run

# Pour desktop
flutter run -d macos  # sur macOS
flutter run -d windows  # sur Windows
flutter run -d linux  # sur Linux
```

### Build pour la production

```bash
# Build web
flutter build web

# Build mobile
flutter build apk  # Android
flutter build ios  # iOS (nécessite macOS)

# Build desktop
flutter build macos  # macOS
flutter build windows  # Windows
flutter build linux  # Linux
```

## 📂 Structure du Projet

```
kaiosa_website/
├── lib/
│   ├── main.dart                    # Point d'entrée de l'application
│   └── screens/
│       ├── home_screen.dart         # Page d'accueil
│       ├── kaiosa_screen.dart       # Origine du nom
│       ├── about_screen.dart        # À propos
│       ├── services_screen.dart     # Services
│       ├── realisations_screen.dart # Réalisations
│       └── contact_screen.dart      # Contact
├── web/
│   └── index.html                   # Page HTML pour Flutter web
├── pubspec.yaml                     # Dépendances du projet
└── README.md                        # Ce fichier
```

## 🎨 Technologies Utilisées

- **Flutter** - Framework UI multiplateforme
- **Google Fonts** - Typographie (Segoe UI, Roboto)
- **Material Design 3** - Design system moderne

## 🌐 Déploiement Web

### GitHub Pages

```bash
flutter build web --base-href "/kaiosa_website/"
# Copier le contenu du dossier build/web vers votre repo GitHub
```

### Firebase Hosting

```bash
flutter build web
firebase init hosting
firebase deploy
```

### Netlify / Vercel

1. Build le projet : `flutter build web`
2. Uploader le dossier `build/web` sur Netlify ou Vercel
3. Configurer la redirection pour SPA

## 🔧 Personnalisation

### Couleurs

Les couleurs principales sont définies dans `main.dart` :

- Vert principal : `#27AE60`
- Vert foncé : `#1E8449`
- Orange : `#F39C12`
- Bleu foncé : `#2C3E50`

### Contenu

Modifier le contenu dans les fichiers correspondants :
- Textes : Dans chaque fichier `*_screen.dart`
- Images : Ajouter dans `assets/` et référencer dans `pubspec.yaml`

### Formulaire de Contact

Le formulaire dans `contact_screen.dart` nécessite un backend pour fonctionner.
Options recommandées :
- Firebase Functions
- API REST personnalisée
- Service tiers (EmailJS, Formspree, etc.)

## 📞 Contact

**KAIOSA** - Conseil en Innovation
- 📍 Saint-Germain-en-Laye, Île-de-France
- 📧 contact@kaiosa.com
- 🌐 https://kaiosa.com

## 📄 Licence

© 2025 KAIOSA. Tous droits réservés.

---

Développé avec ❤️ et Flutter pour KAIOSA
