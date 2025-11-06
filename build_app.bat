@echo off
echo MotivateMe 앱 빌드 스크립트
echo ==========================

echo.
echo 1. APK 빌드 (직접 설치용)
echo 2. App Bundle 빌드 (Google Play 업로드용)
echo 3. 종료
echo.

set /p choice="선택하세요 (1-3): "

if "%choice%"=="1" (
    echo APK 빌드를 시작합니다...
    flutter build apk --release
    echo APK 빌드 완료: build\app\outputs\flutter-apk\app-release.apk
) else if "%choice%"=="2" (
    echo App Bundle 빌드를 시작합니다...
    flutter build appbundle --release
    echo App Bundle 빌드 완료: build\app\outputs\bundle\release\app-release.aab
) else if "%choice%"=="3" (
    echo 종료합니다.
    exit
) else (
    echo 잘못된 선택입니다.
)

echo.
pause
