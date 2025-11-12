@echo off
rem Define o título da janela do terminal
title Script de Build do Flutter

echo.
echo =======================================
echo  INICIANDO BUILD COMPLETO DO APK
echo =======================================
echo.

rem Etapa 1: Flutter Clean
echo [1/3] Limpando o projeto (flutter clean)...
flutter clean

rem O 'if errorlevel 1' verifica se o comando anterior falhou
if errorlevel 1 (
echo.
echo ERRO: Falha no 'flutter clean'. Abortando.
goto end
)

echo.
rem Etapa 2: Flutter Pub Get
echo [2/3] Baixando dependencias (flutter pub get)...
flutter pub get

if errorlevel 1 (
echo.
echo ERRO: Falha no 'flutter pub get'. Abortando.
goto end
)

echo.
rem Etapa 3: Flutter Build APK
echo [3/3] Construindo o APK (flutter build apk)...
flutter build apk

if errorlevel 1 (
echo.
echo ERRO: Falha no 'flutter build apk'.
goto end
)

echo.
echo =======================================
echo  PROCESSO CONCLUIDO COM SUCESSO!
echo =======================================
echo.

:end
rem Mantém a janela aberta para você ler o resultado
pause