#!/bin/bash

echo "🚀 Lancement de KAIOSA Website"
echo "================================"
echo ""

# Vérifier si Flutter est installé
if ! command -v flutter &> /dev/null
then
    echo "❌ Flutter n'est pas installé"
    echo "📥 Téléchargez Flutter depuis: https://flutter.dev/docs/get-started/install"
    exit 1
fi

echo "✅ Flutter détecté: $(flutter --version | head -n 1)"
echo ""

# Installer les dépendances
echo "📦 Installation des dépendances..."
flutter pub get

echo ""
echo "✨ Projet prêt !"
echo ""
echo "Pour lancer l'application:"
echo "  🌐 Web:     flutter run -d chrome"
echo "  📱 Mobile:  flutter run"
echo "  💻 Desktop: flutter run -d macos (ou windows/linux)"
echo ""
echo "Pour compiler:"
echo "  🌐 Web:     flutter build web"
echo "  📱 Android: flutter build apk"
echo "  📱 iOS:     flutter build ios"
echo ""
