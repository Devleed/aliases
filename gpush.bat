@echo off
echo.
git add .
git commit -m %1
git push origin %2