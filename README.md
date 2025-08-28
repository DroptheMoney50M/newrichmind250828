# 🌟 동기부여 명언 앱 (RMA - Remarkable Motivation App)

한국어로 제공되는 동기부여 명언과 개인 목표 설정 기능을 갖춘 Flutter 앱입니다.

## 📱 주요 기능

### 1. 명언 보기
- **360개 이상의 한국어 명언** 수록
- **카테고리별 분류**: 성공, 꿈, 노력, 희망, 도전, 인생, 행복 등 20개 카테고리
- **자동 전환 기능**: 10초마다 새로운 명언 자동 표시
- **수동 전환**: 원할 때 새로운 명언 보기
- **애니메이션 효과**: 부드러운 페이드 인/아웃 애니메이션
- **명언 카운터**: 본 명언 수 기록

### 2. 목표 설정
- **목표 제목** 및 **상세 설명** 입력
- **목표 이미지** 추가 (갤러리에서 선택)
- **편집 모드**: 언제든지 목표 수정 가능
- **자동 저장**: SharedPreferences를 통한 데이터 보존

### 3. 사용자 경험
- **다크/라이트 모드** 지원
- **시스템 테마** 자동 적응
- **Material 3** 디자인 시스템
- **반응형 UI**: 다양한 화면 크기 지원
- **직관적인 네비게이션**: 하단 탭 바

## 🛠️ 기술 스택

- **Framework**: Flutter 3.32.5
- **Language**: Dart
- **Design**: Material 3
- **State Management**: StatefulWidget
- **Local Storage**: SharedPreferences
- **Image Picker**: image_picker 패키지
- **UI Components**: Carousel Slider

## 📂 프로젝트 구조

```
lib/
├── main.dart                    # 앱 진입점
├── main_page.dart              # 메인 페이지 (네비게이션)
├── motivation_page.dart        # 명언 보기 페이지
├── goal_page.dart              # 목표 설정 페이지
└── database/
    └── quote_database.dart     # 명언 데이터베이스
```

## 🗂️ 명언 카테고리

- **성공** (50개): 성공에 관한 조언과 지혜
- **꿈** (50개): 꿈을 이루는 방법과 중요성
- **노력** (50개): 노력의 가치와 결과
- **희망** (50개): 희망이 주는 힘과 의미
- **도전** (50개): 도전 정신과 용기
- **기타**: 실패, 믿음, 시작, 인생, 행복, 행동, 극복 등

## 🚀 설치 및 실행

### 사전 요구사항
- Flutter SDK 3.0.0 이상
- Dart 3.0.0 이상
- iOS 11.0+ / Android API 21+

### 설치 과정

1. **저장소 클론**
```bash
git clone https://github.com/[your-username]/rma.git
cd rma
```

2. **의존성 설치**
```bash
flutter pub get
```

3. **앱 실행**
```bash
# iOS 시뮬레이터
flutter run -d "iPhone"

# Android 에뮬레이터
flutter run -d android

# 웹 브라우저
flutter run -d chrome
```

## 📦 의존성

```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.2.3  # 로컬 데이터 저장
  image_picker: ^1.0.8        # 이미지 선택
  carousel_slider: ^4.2.1     # 슬라이더 UI

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0       # 코드 품질 검사
```

## 🎯 사용법

### 명언 보기
1. 앱 하단의 **"명언"** 탭 선택
2. 자동으로 10초마다 새로운 명언이 표시됩니다
3. 🔄 버튼을 눌러 수동으로 새 명언 보기
4. ⏸️/▶️ 버튼으로 자동 전환 제어

### 목표 설정
1. 앱 하단의 **"목표"** 탭 선택
2. **"목표 수정"** 버튼 클릭
3. 목표 제목과 설명 입력
4. 이미지 영역을 터치하여 목표 이미지 추가
5. **"저장"** 버튼으로 목표 저장

### 테마 변경
1. 상단 우측 ⋮ 메뉴 선택
2. 원하는 테마 선택:
   - 시스템 테마
   - 라이트 모드
   - 다크 모드

## 🌟 특징

- **한국어 전용**: 모든 인터페이스와 명언이 한국어로 제공
- **로그인 불필요**: 별도 회원가입 없이 바로 사용 가능
- **오프라인 사용**: 인터넷 연결 없이도 모든 기능 이용 가능
- **개인정보 보호**: 모든 데이터는 기기에만 저장
- **크로스 플랫폼**: iOS, Android, Web에서 동일한 경험

## 🔮 향후 계획

- [ ] 명언 검색 기능
- [ ] 즐겨찾기 명언
- [ ] 목표 진행률 추적
- [ ] 위젯 지원
- [ ] 명언 공유 기능
- [ ] 알림 설정
- [ ] 명언 카테고리 확장

## 🤝 기여하기

1. Fork 프로젝트
2. Feature 브랜치 생성 (`git checkout -b feature/amazing-feature`)
3. 변경사항 커밋 (`git commit -m 'Add amazing feature'`)
4. 브랜치에 Push (`git push origin feature/amazing-feature`)
5. Pull Request 생성

## 📄 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다. 자세한 내용은 [LICENSE](LICENSE) 파일을 참조하세요.

## 📞 문의

문제가 있거나 제안사항이 있으시면 [Issues](https://github.com/[your-username]/rma/issues)에 등록해 주세요.

---

**💡 매일 새로운 명언으로 동기부여를 받고, 목표를 향해 한 걸음씩 나아가세요!**
# newrichmind250828
