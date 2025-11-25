#!/bin/bash

# Fonction pour garder la fenêtre ouverte
keep_open() {
    echo ""
    echo "Appuie sur ENTRÉE pour fermer..."
    read
}

# Trap pour garder ouvert même en cas d'erreur
trap keep_open EXIT

echo "🚀 KAIOSA - Déploiement GitHub Pages"
echo "====================================="
echo ""

# Couleurs
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Vérifier si Git est installé
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git n'est pas installé${NC}"
    echo ""
    echo "Installe Git depuis: https://git-scm.com/downloads"
    exit 1
fi

# Demander le username GitHub
echo -e "${BLUE}📝 Quel est ton username GitHub ?${NC}"
read -p "Username: " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo -e "${RED}❌ Username requis${NC}"
    exit 1
fi

REPO_NAME="kaiosa_website"
REPO_URL="https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

echo ""
echo -e "${YELLOW}📋 Configuration:${NC}"
echo "  Username: $GITHUB_USERNAME"
echo "  Repo: $REPO_NAME"
echo "  URL: $REPO_URL"
echo ""

# Configurer Git si nécessaire
if [ -z "$(git config user.name)" ]; then
    echo -e "${YELLOW}⚠️  Configuration Git manquante${NC}"
    echo ""
    read -p "Ton nom complet: " GIT_NAME
    read -p "Ton email: " GIT_EMAIL
    
    git config --global user.name "$GIT_NAME"
    git config --global user.email "$GIT_EMAIL"
    
    echo -e "${GREEN}✅ Git configuré${NC}"
    echo ""
fi

# Vérifier si Git est initialisé
if [ ! -d ".git" ]; then
    echo -e "${BLUE}🔧 Initialisation de Git...${NC}"
    git init || {
        echo -e "${RED}❌ Erreur lors de l'initialisation Git${NC}"
        exit 1
    }
    echo -e "${GREEN}✅ Git initialisé${NC}"
else
    echo -e "${YELLOW}ℹ️  Git déjà initialisé${NC}"
fi

# Vérifier si on est sur la bonne branche
CURRENT_BRANCH=$(git branch --show-current)
if [ -z "$CURRENT_BRANCH" ]; then
    echo -e "${BLUE}🔧 Création de la branche main...${NC}"
    git checkout -b main || {
        echo -e "${RED}❌ Erreur lors de la création de la branche${NC}"
        exit 1
    }
fi

# Ajouter tous les fichiers
echo -e "${BLUE}📦 Ajout des fichiers...${NC}"
git add . || {
    echo -e "${RED}❌ Erreur lors de l'ajout des fichiers${NC}"
    exit 1
}

# Vérifier s'il y a des changements à commit
if git diff --staged --quiet; then
    echo -e "${YELLOW}ℹ️  Aucun changement à commiter${NC}"
    
    # Vérifier si des commits existent
    if git rev-parse HEAD >/dev/null 2>&1; then
        echo -e "${YELLOW}ℹ️  Commits existants détectés${NC}"
    else
        echo -e "${RED}❌ Aucun commit et aucun changement${NC}"
        echo "Ajoute des fichiers avant de déployer"
        exit 1
    fi
else
    # Commit
    echo -e "${BLUE}💾 Commit des changements...${NC}"
    git commit -m "🎉 KAIOSA Flutter website" || {
        echo -e "${RED}❌ Erreur lors du commit${NC}"
        exit 1
    }
    echo -e "${GREEN}✅ Commit créé${NC}"
fi

# Vérifier si remote existe
if git remote | grep -q "origin"; then
    echo -e "${YELLOW}ℹ️  Remote origin existe déjà${NC}"
    echo -e "${BLUE}🔄 Mise à jour de l'URL...${NC}"
    git remote set-url origin $REPO_URL
else
    echo -e "${BLUE}🔗 Ajout du remote origin...${NC}"
    git remote add origin $REPO_URL || {
        echo -e "${RED}❌ Erreur lors de l'ajout du remote${NC}"
        exit 1
    }
fi

echo -e "${GREEN}✅ Remote configuré${NC}"

# Pousser vers GitHub
echo ""
echo -e "${BLUE}🚀 Push vers GitHub...${NC}"
echo -e "${YELLOW}⚠️  Si c'est la première fois, tu devras entrer tes identifiants GitHub${NC}"
echo -e "${YELLOW}⚠️  Utilise ton username GitHub et un Personal Access Token comme mot de passe${NC}"
echo ""

git push -u origin main 2>&1

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}✅ Push réussi !${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo -e "${GREEN}🎉 Félicitations ! Ton code est sur GitHub.${NC}"
    echo ""
    echo -e "${YELLOW}📋 PROCHAINES ÉTAPES IMPORTANTES:${NC}"
    echo ""
    echo "1. 🌐 Va sur: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
    echo ""
    echo "2. 🔧 Clique sur 'Settings' (en haut à droite)"
    echo ""
    echo "3. 📄 Dans le menu de gauche, clique sur 'Pages'"
    echo ""
    echo "4. 🎯 Dans 'Source', sélectionne:"
    echo "   - Branch: gh-pages"
    echo "   - Folder: / (root)"
    echo ""
    echo "5. 💾 Clique sur 'Save'"
    echo ""
    echo "6. ⏱️  Attends 2-3 minutes, puis visite:"
    echo -e "   ${BLUE}🌐 https://$GITHUB_USERNAME.github.io/$REPO_NAME/${NC}"
    echo ""
    echo -e "${YELLOW}Note: Le workflow GitHub Actions va compiler ton site automatiquement${NC}"
    echo -e "${YELLOW}Tu peux suivre la progression dans l'onglet 'Actions' de ton repo${NC}"
    echo ""
else
    echo ""
    echo -e "${RED}========================================${NC}"
    echo -e "${RED}❌ Erreur lors du push${NC}"
    echo -e "${RED}========================================${NC}"
    echo ""
    echo -e "${YELLOW}💡 Solutions possibles:${NC}"
    echo ""
    echo "1️⃣  ${BLUE}Crée le repo sur GitHub (si pas fait):${NC}"
    echo "   🌐 https://github.com/new"
    echo "   Nom du repo: $REPO_NAME"
    echo "   Type: Public"
    echo ""
    echo "2️⃣  ${BLUE}Utilise un Personal Access Token:${NC}"
    echo "   a) Va sur: https://github.com/settings/tokens"
    echo "   b) Clique 'Generate new token (classic)'"
    echo "   c) Coche 'repo'"
    echo "   d) Copie le token"
    echo "   e) Utilise-le comme mot de passe quand Git demande"
    echo ""
    echo "3️⃣  ${BLUE}Réessaye le push manuellement:${NC}"
    echo "   git push -u origin main"
    echo ""
fi
