# Guide de Personnalisation KAIOSA

Ce guide vous montre comment personnaliser facilement votre application Flutter KAIOSA.

## 🎨 Changer les Couleurs

### Dans `lib/main.dart`

```dart
// Ligne ~25
theme: ThemeData(
  primaryColor: const Color(0xFF27AE60),  // ← Votre couleur principale
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF27AE60),   // ← Même couleur
    secondary: const Color(0xFFF39C12),   // ← Couleur secondaire
  ),
),
```

### Palette de Couleurs Recommandées

```dart
// Vert actuel (Innovation, Nature)
Primary: 0xFF27AE60
Secondary: 0xFFF39C12

// Alternative Bleu (Technologie, Confiance)
Primary: 0xFF2196F3
Secondary: 0xFFFF9800

// Alternative Rouge (Énergie, Passion)
Primary: 0xFFE53935
Secondary: 0xFFFDD835

// Alternative Violet (Créativité, Premium)
Primary: 0xFF9C27B0
Secondary: 0xFF00BCD4
```

### Appliquer dans Tout le Code

Rechercher et remplacer :
- `Color(0xFF27AE60)` → Votre nouvelle couleur primaire
- `Color(0xFF1E8449)` → Version plus foncée (utilisez ColorBrewer)
- `Color(0xFFF39C12)` → Votre nouvelle couleur secondaire

## 📝 Modifier les Textes

### Texte de Bienvenue (Home)

**Fichier** : `lib/screens/home_screen.dart`

```dart
// Ligne ~44
Text(
  'Ma Philosophie',  // ← Changez le titre
  style: GoogleFonts.roboto(...),
),

// Ligne ~51
Text(
  'On me demande souvent...',  // ← Changez le texte
),
```

### Informations de Contact (Footer)

Rechercher dans tous les fichiers `*_screen.dart` :

```dart
Text('📍 Saint-Germain-en-Laye, Île-de-France'),
// Remplacer par votre adresse

Text('📧 contact@kaiosa.com'),
// Remplacer par votre email
```

### Méthode Rapide (Recherche Globale)

1. Ouvrir VS Code
2. `Cmd/Ctrl + Shift + F` (Recherche dans tous les fichiers)
3. Rechercher : `contact@kaiosa.com`
4. Remplacer tout : `votre@email.com`

## 🖼️ Ajouter des Images

### 1. Créer le Dossier Assets

```bash
mkdir -p assets/images
```

### 2. Ajouter Images

```
assets/
└── images/
    ├── logo.png
    ├── hero-bg.jpg
    ├── project1.jpg
    ├── project2.jpg
    └── ...
```

### 3. Déclarer dans `pubspec.yaml`

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/images/
```

### 4. Utiliser dans le Code

#### Logo dans AppBar

```dart
// Dans lib/main.dart, ligne ~95
Row(
  children: [
    Image.asset(
      'assets/images/logo.png',
      height: 40,
    ),
    SizedBox(width: 8),
    Text('KAIOSA', ...),
  ],
)
```

#### Image de Fond

```dart
// Dans n'importe quel écran
Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/hero-bg.jpg'),
      fit: BoxFit.cover,
    ),
  ),
  child: ...,
)
```

#### Images de Projets

```dart
// Dans realisations_screen.dart
Container(
  height: 150,
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/project1.jpg'),
      fit: BoxFit.cover,
    ),
    // Supprimez le gradient si vous voulez voir l'image
  ),
)
```

## 📱 Ajouter une Nouvelle Section

### Exemple : Section "Blog"

#### 1. Créer le Fichier

```bash
touch lib/screens/blog_screen.dart
```

#### 2. Code du Screen

```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(60),
            child: Text(
              'Blog KAIOSA',
              style: GoogleFonts.roboto(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
            ),
          ),
          // Vos articles de blog ici
        ],
      ),
    );
  }
}
```

#### 3. Ajouter à la Navigation

Dans `lib/main.dart` :

```dart
// Ligne ~11 : Importer
import 'screens/blog_screen.dart';

// Ligne ~35 : Ajouter à la liste des screens
final List<Widget> _screens = [
  const HomeScreen(),
  const KaiosaScreen(),
  const AboutScreen(),
  const ServicesScreen(),
  const RealisationsScreen(),
  const BlogScreen(),        // ← Nouveau !
  const ContactScreen(),
];

// Ligne ~41 : Ajouter le titre
final List<String> _titles = [
  'Accueil',
  'Kaiosa ?',
  'À propos',
  'Services',
  'Réalisations',
  'Blog',                    // ← Nouveau !
  'Contact',
];
```

## 🎭 Personnaliser les Animations

### Durée de Transition

```dart
// Dans lib/main.dart, ligne ~150
AnimatedSwitcher(
  duration: const Duration(milliseconds: 300),  // ← Changez la durée
  child: _screens[_selectedIndex],
)
```

### Animations Personnalisées

```dart
AnimatedSwitcher(
  duration: const Duration(milliseconds: 500),
  transitionBuilder: (Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.3, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  },
  child: _screens[_selectedIndex],
)
```

## 🔗 Ajouter des Liens Externes

### Installer le Package

```bash
flutter pub add url_launcher
```

### Utiliser dans le Code

```dart
import 'package:url_launcher/url_launcher.dart';

// Bouton LinkedIn
ElevatedButton(
  onPressed: () async {
    final url = Uri.parse('https://linkedin.com/in/jerome-ollivon');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  },
  child: Text('LinkedIn'),
)

// Email
TextButton(
  onPressed: () async {
    final url = Uri.parse('mailto:contact@kaiosa.com');
    await launchUrl(url);
  },
  child: Text('contact@kaiosa.com'),
)

// Téléphone
TextButton(
  onPressed: () async {
    final url = Uri.parse('tel:+33123456789');
    await launchUrl(url);
  },
  child: Text('Appeler'),
)
```

## 📊 Ajouter Google Analytics

### 1. Installer Firebase

```bash
flutter pub add firebase_core
flutter pub add firebase_analytics
```

### 2. Configuration

```dart
// Dans lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const KaiosaApp());
}

// Dans la classe KaiosaApp
static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
static FirebaseAnalyticsObserver observer =
    FirebaseAnalyticsObserver(analytics: analytics);

// Dans MaterialApp
return MaterialApp(
  navigatorObservers: [observer],
  // ...
);
```

### 3. Tracker des Événements

```dart
// Bouton de contact cliqué
analytics.logEvent(
  name: 'contact_button_clicked',
  parameters: {'source': 'home_screen'},
);

// Page vue
analytics.logEvent(
  name: 'screen_view',
  parameters: {'screen_name': 'services'},
);
```

## 🌍 Multilingue (i18n)

### 1. Installer le Package

```bash
flutter pub add flutter_localizations
flutter pub add intl
```

### 2. Créer les Fichiers de Traduction

```
lib/
└── l10n/
    ├── app_en.arb
    └── app_fr.arb
```

**app_fr.arb** :
```json
{
  "appTitle": "KAIOSA - Conseil en Innovation",
  "home": "Accueil",
  "about": "À propos",
  "services": "Services",
  "contact": "Contact"
}
```

**app_en.arb** :
```json
{
  "appTitle": "KAIOSA - Innovation Consulting",
  "home": "Home",
  "about": "About",
  "services": "Services",
  "contact": "Contact"
}
```

### 3. Configurer dans pubspec.yaml

```yaml
flutter:
  generate: true
```

### 4. Utiliser dans le Code

```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Dans MaterialApp
return MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  // ...
);

// Dans les widgets
Text(AppLocalizations.of(context)!.home)
```

## 🎨 Thème Sombre

### Dans lib/main.dart

```dart
return MaterialApp(
  theme: ThemeData.light().copyWith(
    primaryColor: const Color(0xFF27AE60),
    // ... votre thème clair
  ),
  darkTheme: ThemeData.dark().copyWith(
    primaryColor: const Color(0xFF27AE60),
    scaffoldBackgroundColor: const Color(0xFF1E1E1E),
    cardColor: const Color(0xFF2C2C2C),
  ),
  themeMode: ThemeMode.system,  // Suit les préférences système
  // ...
);
```

### Switcher Manuellement

```dart
// État dans MainScreen
bool isDarkMode = false;

// Toggle
IconButton(
  icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
  onPressed: () {
    setState(() => isDarkMode = !isDarkMode);
  },
)

// Dans MaterialApp
themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
```

## 📧 Formulaire de Contact Fonctionnel

### Option 1 : EmailJS (Gratuit, Simple)

```dart
// 1. S'inscrire sur emailjs.com
// 2. Installer http package
flutter pub add http

// 3. Code d'envoi
Future<void> sendEmail(String name, String email, String message) async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  
  await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'service_id': 'VOTRE_SERVICE_ID',
      'template_id': 'VOTRE_TEMPLATE_ID',
      'user_id': 'VOTRE_USER_ID',
      'template_params': {
        'from_name': name,
        'from_email': email,
        'message': message,
      }
    }),
  );
}
```

### Option 2 : Firebase Functions

```dart
// 1. Installer Firebase
flutter pub add cloud_functions

// 2. Créer une fonction dans Firebase Console
// functions/index.js
exports.sendEmail = functions.https.onCall(async (data, context) => {
  // Envoyer email avec Nodemailer
});

// 3. Appeler depuis Flutter
final callable = FirebaseFunctions.instance.httpsCallable('sendEmail');
await callable.call({
  'name': name,
  'email': email,
  'message': message,
});
```

## 🚀 Optimisation Performance

### Lazy Loading des Images

```dart
import 'package:cached_network_image/cached_network_image.dart';

CachedNetworkImage(
  imageUrl: 'https://...',
  placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => Icon(Icons.error),
)
```

### Code Splitting

```dart
// Au lieu de
import 'screens/services_screen.dart';

// Utiliser
final servicesScreen = () async {
  return (await import('screens/services_screen.dart')).ServicesScreen();
};
```

## 📱 Tester sur Mobile

### Android

```bash
# Connecter appareil ou lancer émulateur
flutter devices

# Lancer
flutter run
```

### iOS (nécessite macOS)

```bash
# Ouvrir simulateur
open -a Simulator

# Lancer
flutter run
```

## 🎉 Conseils Finaux

1. **Testez après chaque modification** : `flutter run`
2. **Utilisez Hot Reload** : Appuyez sur `r` dans le terminal
3. **Committez souvent** : Utilisez Git
4. **Documentez vos changements** : Commentez le code
5. **Gardez le code propre** : Formatez avec `flutter format .`

---

Pour plus d'aide :
- 📚 [Documentation Flutter](https://flutter.dev/docs)
- 💬 [Discord Flutter France](https://discord.gg/flutter)
- 📧 contact@kaiosa.com
