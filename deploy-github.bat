@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo 🚀 KAIOSA - Déploiement GitHub Pages
echo ========================================
echo.

REM Vérifier si Git est installé
where git >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Git n'est pas installé
    echo.
    echo Télécharge Git depuis: https://git-scm.com/downloads
    echo.
    pause
    exit /b 1
)

REM Demander le username GitHub
set /p GITHUB_USERNAME="📝 Ton username GitHub: "

if "%GITHUB_USERNAME%"=="" (
    echo ❌ Username requis
    pause
    exit /b 1
)

set REPO_NAME=kaiosa_website
set REPO_URL=https://github.com/%GITHUB_USERNAME%/%REPO_NAME%.git

echo.
echo 📋 Configuration:
echo   Username: %GITHUB_USERNAME%
echo   Repo: %REPO_NAME%
echo   URL: %REPO_URL%
echo.

REM Vérifier la config Git
git config user.name >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ⚠️  Configuration Git manquante
    echo.
    set /p GIT_NAME="Ton nom complet: "
    set /p GIT_EMAIL="Ton email: "
    
    git config --global user.name "!GIT_NAME!"
    git config --global user.email "!GIT_EMAIL!"
    
    echo ✅ Git configuré
    echo.
)

REM Vérifier si Git est initialisé
if not exist ".git" (
    echo 🔧 Initialisation de Git...
    git init
    if %ERRORLEVEL% NEQ 0 (
        echo ❌ Erreur lors de l'initialisation Git
        pause
        exit /b 1
    )
    echo ✅ Git initialisé
) else (
    echo ℹ️  Git déjà initialisé
)

REM Créer la branche main si nécessaire
for /f "delims=" %%i in ('git branch --show-current 2^>nul') do set CURRENT_BRANCH=%%i
if "%CURRENT_BRANCH%"=="" (
    echo 🔧 Création de la branche main...
    git checkout -b main
    if %ERRORLEVEL% NEQ 0 (
        echo ❌ Erreur lors de la création de la branche
        pause
        exit /b 1
    )
)

REM Ajouter tous les fichiers
echo 📦 Ajout des fichiers...
git add .
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Erreur lors de l'ajout des fichiers
    pause
    exit /b 1
)

REM Commit
echo 💾 Commit des changements...
git commit -m "🎉 KAIOSA Flutter website"
if %ERRORLEVEL% NEQ 0 (
    echo ℹ️  Rien à commiter ou commit déjà existant
)

REM Vérifier si remote existe
git remote | findstr "origin" >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo ℹ️  Remote origin existe déjà
    echo 🔄 Mise à jour de l'URL...
    git remote set-url origin %REPO_URL%
) else (
    echo 🔗 Ajout du remote origin...
    git remote add origin %REPO_URL%
    if %ERRORLEVEL% NEQ 0 (
        echo ❌ Erreur lors de l'ajout du remote
        pause
        exit /b 1
    )
)

echo ✅ Remote configuré
echo.

REM Pousser vers GitHub
echo 🚀 Push vers GitHub...
echo ⚠️  Si c'est la première fois, tu devras entrer tes identifiants
echo ⚠️  Utilise un Personal Access Token comme mot de passe
echo.

git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo ✅ Push réussi !
    echo ========================================
    echo.
    echo 🎉 Félicitations ! Ton code est sur GitHub.
    echo.
    echo 📋 PROCHAINES ÉTAPES IMPORTANTES:
    echo.
    echo 1. 🌐 Va sur: https://github.com/%GITHUB_USERNAME%/%REPO_NAME%
    echo.
    echo 2. 🔧 Clique sur 'Settings' (en haut à droite^)
    echo.
    echo 3. 📄 Dans le menu de gauche, clique sur 'Pages'
    echo.
    echo 4. 🎯 Dans 'Source', sélectionne:
    echo    - Branch: gh-pages
    echo    - Folder: / (root^)
    echo.
    echo 5. 💾 Clique sur 'Save'
    echo.
    echo 6. ⏱️  Attends 2-3 minutes, puis visite:
    echo    🌐 https://%GITHUB_USERNAME%.github.io/%REPO_NAME%/
    echo.
    echo Note: Le workflow GitHub Actions va compiler ton site automatiquement
    echo Tu peux suivre la progression dans l'onglet 'Actions' de ton repo
    echo.
) else (
    echo.
    echo ========================================
    echo ❌ Erreur lors du push
    echo ========================================
    echo.
    echo 💡 Solutions possibles:
    echo.
    echo 1️⃣  Crée le repo sur GitHub (si pas fait^):
    echo    🌐 https://github.com/new
    echo    Nom du repo: %REPO_NAME%
    echo    Type: Public
    echo.
    echo 2️⃣  Utilise un Personal Access Token:
    echo    a^) Va sur: https://github.com/settings/tokens
    echo    b^) Clique 'Generate new token (classic^)'
    echo    c^) Coche 'repo'
    echo    d^) Copie le token
    echo    e^) Utilise-le comme mot de passe quand Git demande
    echo.
    echo 3️⃣  Réessaye le push manuellement:
    echo    git push -u origin main
    echo.
)

pause
