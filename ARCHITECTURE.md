# Architecture de l'Application KAIOSA

## 🏗️ Vue d'Ensemble

L'application KAIOSA est construite avec Flutter en suivant une architecture simple et claire.

```
┌─────────────────────────────────────────┐
│          MainScreen (main.dart)         │
│  Navigation principale + AppBar         │
└─────────────────┬───────────────────────┘
                  │
        ┌─────────┴─────────┐
        │  AnimatedSwitcher │ (Transitions fluides)
        └─────────┬─────────┘
                  │
    ┌─────────────┴─────────────┐
    │     Écrans (Screens)       │
    └────────────────────────────┘
              │
    ┌─────────┴─────────┐
    │                   │
┌───▼────┐      ┌──────▼─────┐
│ Home   │      │  Kaiosa?   │
└────────┘      └────────────┘
┌────────┐      ┌────────────┐
│ About  │      │  Services  │
└────────┘      └────────────┘
┌────────────┐  ┌────────────┐
│Réalisations│  │  Contact   │
└────────────┘  └────────────┘
```

## 📱 Navigation

### MainScreen (main.dart)
- **Rôle** : Conteneur principal avec AppBar et navigation
- **État** : `_selectedIndex` pour suivre la page active
- **Responsive** : Drawer sur mobile, menu horizontal sur desktop

### Gestion de l'État
```dart
setState(() => _selectedIndex = newIndex)
  ↓
AnimatedSwitcher détecte le changement
  ↓
Transition fluide vers le nouvel écran
```

## 🎨 Structure d'un Écran Type

Chaque écran suit cette structure :

```dart
class XXXScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(  // Scroll vertical
      child: Column(
        children: [
          _buildSection1(),  // Section héro
          _buildSection2(),  // Contenu principal
          _buildSection3(),  // Call-to-action
          _buildFooter(),    // Pied de page
        ],
      ),
    );
  }
}
```

## 🎯 Sections par Écran

### 1. HomeScreen (home_screen.dart)
```
├── Philosophie (texte + visuel)
├── Méthode (4 étapes en cards)
├── Valeurs (4 cards)
└── Footer
```

### 2. KaiosaScreen (kaiosa_screen.dart)
```
├── Révélation (Kaio-sama)
├── Philosophie commune
├── Parallèles (4 comparaisons)
└── Footer
```

### 3. AboutScreen (about_screen.dart)
```
├── Intro (profile + texte)
├── Expertise (3 domaines)
├── Approche unique
├── Différenciateurs
└── Footer
```

### 4. ServicesScreen (services_screen.dart)
```
├── Intro
├── 3 Services (cards détaillées)
├── Processus (5 étapes)
├── Témoignages
├── Call-to-Action
└── Footer
```

### 5. RealisationsScreen (realisations_screen.dart)
```
├── Stats (chiffres clés)
├── Portfolio (6 projets)
├── Processus showcase
├── Témoignage
├── Call-to-Action
└── Footer
```

### 6. ContactScreen (contact_screen.dart)
```
├── Hero section
├── Infos de contact (3 cards)
├── Formulaire
└── Footer
```

## 🎨 Système de Design

### Couleurs Principales
```dart
Primary Green:    #27AE60
Dark Green:       #1E8449
Orange:           #F39C12
Dark Blue:        #2C3E50
Light Blue:       #3498DB
Light Grey:       #ECF0F1
Yellow:           #F1C40F
```

### Typographie
- **Police principale** : Segoe UI / Roboto (Google Fonts)
- **Titres** : 42px, Bold
- **Sous-titres** : 20-24px, Bold
- **Texte** : 14-18px, Regular

### Composants Réutilisables

#### Card avec Shadow
```dart
BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(15),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 15,
      offset: Offset(0, 5),
    ),
  ],
)
```

#### Bouton Principal
```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xFF27AE60),
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
  ),
)
```

#### Section Container
```dart
Container(
  color: Colors.white, // ou Color(0xFFECF0F1)
  padding: EdgeInsets.symmetric(vertical: 60, horizontal: 40),
  child: ...
)
```

## 📱 Responsive Design

### Breakpoints
- **Mobile** : < 800px → Drawer + Stack layout
- **Desktop** : ≥ 800px → Horizontal menu + Grid/Row layout

### Adaptation
```dart
final isMobile = MediaQuery.of(context).size.width < 800;

if (isMobile) {
  return Column(...);  // Vertical sur mobile
} else {
  return Row(...);     // Horizontal sur desktop
}
```

## 🔄 Flux de Données

```
User Action (tap menu)
    ↓
setState() dans MainScreen
    ↓
_selectedIndex updated
    ↓
AnimatedSwitcher rebuild
    ↓
Nouvel écran affiché
```

## 🚀 Performance

### Optimisations Appliquées
- ✅ `const` constructors partout où possible
- ✅ `SingleChildScrollView` au lieu de `ListView` (moins de widgets)
- ✅ Lazy loading implicite via Flutter
- ✅ Animations GPU-accelerated
- ✅ Images optimisées (à faire : ajouter des assets)

### À Améliorer
- [ ] Lazy loading des écrans (avec AutoRoute ou GoRouter)
- [ ] Cache des images
- [ ] State management (Provider/Riverpod) si l'app grandit
- [ ] Internationalisation (i18n) pour multi-langue

## 🧪 Tests

### Structure de Tests (à implémenter)
```
test/
├── unit/           # Tests unitaires
├── widget/         # Tests de widgets
└── integration/    # Tests E2E
```

## 📦 Dépendances

```yaml
google_fonts: ^6.1.0        # Typographie
url_launcher: ^6.2.0        # Ouvrir liens externes
animated_text_kit: ^4.2.2   # Animations texte (optionnel)
font_awesome_flutter: ^10.6 # Icons (optionnel)
```

## 🔐 Sécurité

### Points d'Attention
- [ ] Valider les entrées du formulaire contact
- [ ] Implémenter un captcha (reCAPTCHA)
- [ ] Rate limiting sur les envois de formulaire
- [ ] HTTPS obligatoire en production
- [ ] Pas de données sensibles en dur dans le code

## 🌐 Déploiement

### Web (Recommandé)
1. `flutter build web --release`
2. Déployer `build/web/` sur :
   - Firebase Hosting
   - Netlify
   - Vercel
   - GitHub Pages

### Configuration Serveur Web
```nginx
# nginx.conf pour SPA
location / {
    try_files $uri $uri/ /index.html;
}
```

## 🔮 Évolutions Futures

### Court terme
- [ ] Ajouter des images réelles dans les projets
- [ ] Implémenter l'envoi de formulaire
- [ ] Ajouter Google Analytics
- [ ] SEO optimization (meta tags)

### Moyen terme
- [ ] Mode sombre
- [ ] Animations plus poussées
- [ ] Blog/Actualités
- [ ] Galerie photos des réalisations

### Long terme
- [ ] Espace client (avec authentification)
- [ ] Suivi de projets en ligne
- [ ] Calendrier de disponibilités
- [ ] Chat en direct

---

**Note** : Cette architecture privilégie la simplicité et la clarté. Pour une application plus complexe, envisager :
- Router (go_router, auto_route)
- State management (Riverpod, Bloc)
- Dependency injection (get_it)
- Backend Firebase ou Supabase
