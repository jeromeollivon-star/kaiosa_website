@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo 🔧 KAIOSA - Correction et Redéploiement
echo ========================================
echo.

echo 📝 Les fichiers ont été corrigés :
echo   ✅ .github/workflows/deploy.yml (base-href^)
echo   ✅ web/index.html (base-href^)
echo   ✅ Ajout du 404.html
echo.

echo 🚀 Redéploiement en cours...
echo.

REM Ajouter les changements
git add .

REM Commit
git commit -m "🔧 Fix: Correct base-href for GitHub Pages"

REM Push
git push

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo ✅ Redéploiement réussi !
    echo ========================================
    echo.
    echo ⏱️  Attends 3-4 minutes que GitHub Actions compile...
    echo.
    echo 📊 Suis la progression ici :
    echo    https://github.com/jeromeollivon-star/kaiosa_website/actions
    echo.
    echo 🌐 Puis visite ton site :
    echo    https://jeromeollivon-star.github.io/kaiosa_website/
    echo.
) else (
    echo.
    echo ========================================
    echo ❌ Erreur lors du push
    echo ========================================
    echo.
    echo Essaie manuellement :
    echo   git add .
    echo   git commit -m "Fix base-href"
    echo   git push
    echo.
)

pause
