@echo off
echo MotivateMe v2.0.0 Google Play Store 빌드 스크립트
echo ===========================================

echo.
echo Google Play Store 업로드용 App Bundle (AAB) 파일을 생성합니다.
echo.

echo 1단계: 의존성 확인 및 정리...
flutter clean
flutter pub get

echo.
echo 2단계: Release 빌드 생성...
flutter build appbundle --release

echo.
echo 3단계: 빌드 완료!
echo.
echo 생성된 파일 위치:
echo build\app\outputs\bundle\release\app-release.aab
echo.
echo 이 파일을 Google Play Console에 업로드하세요.
echo.

echo 4단계: 파일 크기 확인...
dir build\app\outputs\bundle\release\app-release.aab

echo.
echo APK 테스트용 파일도 생성하시겠습니까? (y/n)
set /p choice="선택: "

if /i "%choice%"=="y" (
    echo.
    echo 테스트용 APK 생성 중...
    flutter build apk --release
    echo.
    echo APK 파일 위치: build\app\outputs\flutter-apk\app-release.apk
    dir build\app\outputs\flutter-apk\app-release.apk
)

echo.
echo ✅ 빌드 완료!
echo.
echo Google Play Store 업로드 가이드:
echo 1. Google Play Console (https://play.google.com/console) 접속
echo 2. 앱 선택 또는 새 앱 생성
echo 3. 출시 ^> 프로덕션 선택
echo 4. 새 버전 만들기
echo 5. app-release.aab 파일 업로드
echo 6. 출시 노트 작성 (RELEASE_NOTES_v2.0.0.md 참고)
echo 7. 검토 후 출시
echo.

pause