# 📝 TODO 앱 프로젝트

## 🚀 기술 스택
- Flutter 3.38.3 (Android)
- 상태 관리: Riverpod
- 로컬 저장: Hive

## ✨ 주요 기능
- 사용자 정보 등록
- Todo 리스트
  - 추가, 삭제, 필터, 검색
- Todo 상세
  - 삭제, 수정(미완성)
- Todo 추가
  - 이미지 및 태그 추가 가능
  - 임시 저장(미완성)

## 프로젝트 구동 방법
> 📂 GitHub 저장소
[https://github.com/6UNHEE/todo_project](https://github.com/6UNHEE/todo_project)

## 프로젝트 구동 방법

### 1️⃣ 환경 준비

* Flutter 설치: [Flutter 공식 사이트](https://flutter.dev/docs/get-started/install)
* Android Studio 또는 VS Code 설치
* Android SDK 설치 및 환경 변수 설정
* 실제 Android 기기 또는 에뮬레이터 준비

### 2️⃣ 프로젝트 클론

```bash
git clone https://github.com/6UNHEE/todo_project.git
cd todo_project
```

### 3️⃣ 패키지 설치

```bash
flutter pub get
```

### 4️⃣ 앱 실행

* 에뮬레이터 실행 또는 USB로 기기 연결 후

```bash
flutter run
```

* 앱 실행 후 Hot Reload / Hot Restart 가능

### 5️⃣ APK 빌드 (선택)

* 디버그 APK:

```bash
flutter build apk --debug
```

* 릴리즈 APK:

```bash
flutter build apk --release
```

* 빌드 후 APK 위치: `build/app/outputs/flutter-apk/`

---

## 📱 프로젝트 기능

* Todo 생성, 수정, 삭제
* 이미지 추가/삭제
* 태그 추가/삭제
* 완료 체크 기능

---

## ⚠️ 주의사항

* Flutter SDK 3.0 이상 권장
* Android Emulator 권장, 실제 기기 테스트 가능


## 🏗️ 앱 구조
- **UI ↔ Provider ↔ Service**
  - **UI**: 화면 표시, 사용자 입력 처리
  - **Provider/Notifier**: 상태 관리 및 UI와 Service 연결
  - **Service**: 비즈니스 로직 담당 (Hive 저장/삭제/수정)
  - 대부분 Service를 Provider로 등록 후, Notifier 생성자에서 Service를 받아 상태 관리

## 🖼️ 화면 구성
1. 메인 화면
2. 사용자 정보 등록 화면 (이름, 프로필 사진)
3. 리스트 추가 화면
4. 리스트 수정 화면
5. 태그 관리 화면 (추가/수정/삭제)
6. 필터 설정 화면

## 화면 흐름
- 메인 화면
  - 이름 클릭 → 사용자 정보 등록 화면
  - + 버튼 클릭 → 리스트 추가 화면
  - AppBar 액션 클릭 → 태그/필터 설정 화면
  - 리스트 클릭 → 리스트 수정/삭제 화면
- 사용자 정보 등록 화면
  - 이름 클릭 → 이름 설정 화면
  - 프로필 사진 클릭 → 프로필 설정 화면
- 리스트 추가 화면
  - 이미지, 태그 추가 가능
- 태그 관리 화면
  - 태그 추가/수정/삭제 가능
- 필터 설정 화면
  - 전체/완료/진행중 필터 가능

## 💾 데이터 모델
- **TagModel**
  - id (int): 고유 ID
  - name (String): 태그 이름
- **TodoModel**
  - id (int): 고유 ID
  - title (String)
  - tag (List<TagModel>)
  - createdAt (String)
  - updatedAt (String, nullable)
  - isDone (bool)
  - imagePath (String, nullable)

## 💡 개발 선택 이유
- **상태 관리**: Riverpod 사용 → Provider 개념과 유사, UI와 Service 분리 용이
- **로컬 저장**: Hive 사용 → 로컬 데이터 저장, SharedPreferences보다 구조화된 데이터 관리 가능
  

## 개발 고민 및 아쉬운 점
- **UI 설계**
  - 공통 UI 요소는 최대한 위젯으로 재사용
  - 앱 테마와 자주 쓰는 설정은 클래스화하여 한 번만 변경하면 전체 적용
- **상태 관리**
  - Provider 개념과 비슷하지만 Provider + Service와 연동하는 구조가 어려웠음
  - Service에서 상태를 관리하면 안된다는 점을 알게됨
- **데이터 처리**
  - Hive 객체 저장/일반 변수 저장 차이가 있는 것을 알게됨
  - List<TagModel>가 null일 때 오류 발생 → 기본값 [] 처리했지만 오류 원인 이해 필요함
  - 현재 구조는 main에서 box를 모두 열고 Service에서 사용 → 더 안전한 Hive 구조 설계 고민 필요
- **Git**
  - 처음에는 branch를 잘 사용했지만 복잡해질수록 branch 사용이 어려웠음

## 미완성 기능
- 임시 저장 기능
- 리스트 수정
