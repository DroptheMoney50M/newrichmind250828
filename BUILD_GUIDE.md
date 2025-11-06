# MotivateMe 앱 빌드 가이드

## 🔐 키스토어 설정 완료 사항

### 1. 생성된 파일들
- `android/kwonfamily-key.jks` - 키스토어 파일
- `android/key.properties` - 키 속성 파일
- `android/app/proguard-rules.pro` - ProGuard 규칙
- `build_app.bat` - 빌드 스크립트

### 2. 설정해야 할 내용

#### key.properties 파일 수정
`android/key.properties` 파일을 열어서 실제 비밀번호를 입력하세요:

```
storePassword=실제_키스토어_비밀번호
keyPassword=실제_키_비밀번호
keyAlias=kwonfamily
storeFile=kwonfamily-key.jks
```

### 3. 빌드 방법

#### 방법 1: 배치 파일 사용
```bash
# Windows 명령 프롬프트에서
build_app.bat
```

#### 방법 2: 직접 명령어 사용
```bash
# Google Play 업로드용 App Bundle
flutter build appbundle --release

# 직접 설치용 APK
flutter build apk --release
```

### 4. 빌드 결과 파일 위치
- **App Bundle**: `build/app/outputs/bundle/release/app-release.aab`
- **APK**: `build/app/outputs/flutter-apk/app-release.apk`

## ⚠️ 중요 보안 사항

1. **절대 공유 금지**: `kwonfamily-key.jks`와 `key.properties` 파일
2. **백업 필수**: 키스토어 파일과 비밀번호를 안전한 곳에 백업
3. **Git 제외**: `.gitignore`에서 키 파일들이 제외되도록 설정됨

## 📱 Google Play Console 업로드

1. `app-release.aab` 파일을 Google Play Console에 업로드
2. 모든 업데이트는 동일한 `kwonfamily-key.jks`로 서명
3. **새로운 패키지 이름**: `com.kwonfamily.motivateme`
4. 키를 분실하면 새로운 앱으로 다시 등록해야 함

## 🔧 문제 해결

### 빌드 오류 시
```bash
flutter clean
flutter pub get
flutter build appbundle --release
```

### 키스토어 비밀번호 확인
```bash
keytool -list -v -keystore android/kwonfamily-key.jks
```
