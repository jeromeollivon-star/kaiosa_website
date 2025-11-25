#!/bin/bash

echo "🔧 KAIOSA - Correction et Redéploiement"
echo "======================================="
echo ""

# Couleurs
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}📝 Les fichiers ont été corrigés :${NC}"
echo "  ✅ .github/workflows/deploy.yml (base-href)"
echo "  ✅ web/index.html (base-href)"
echo "  ✅ Ajout du 404.html"
echo ""

echo -e "${YELLOW}🚀 Redéploiement en cours...${NC}"
echo ""

# Ajouter les changements
git add .

# Commit
git commit -m "🔧 Fix: Correct base-href for GitHub Pages"

# Push
git push

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}✅ Redéploiement réussi !${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo "⏱️  Attends 3-4 minutes que GitHub Actions compile..."
    echo ""
    echo "📊 Suis la progression ici :"
    echo "   https://github.com/jeromeollivon-star/kaiosa_website/actions"
    echo ""
    echo "🌐 Puis visite ton site :"
    echo "   https://jeromeollivon-star.github.io/kaiosa_website/"
    echo ""
else
    echo ""
    echo -e "${RED}❌ Erreur lors du push${NC}"
    echo ""
    echo "Essaie manuellement :"
    echo "  git add ."
    echo "  git commit -m 'Fix base-href'"
    echo "  git push"
    echo ""
fi

echo ""
echo "Appuie sur ENTRÉE pour fermer..."
read
