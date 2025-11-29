# TODO 앱 구현

## 기술 조건
1. Flutter version 3.29.0 이상 
2. Android 플랫폼

### 기능
1. 사용자 정보 등록 [ ]
2. Todo List
   - 삭제 [ ]
   - 필터 [ ]
   - 검색 [ ]
3. Todo 상세
   - 삭제 [ ]
   - 수정 [ ]
4. Todo 추가
   - 임시저장 [ ]

#### 개발 분석 노트
> UI

- 공통 Scaffold 생성 
  - 필수 : SafeArea, 바깥 여백
  - 옵션 : AppBar 설정, child 위젯
  
1. 사용자 정보 등록 페이지

<img width="275" height="577" alt="Image" src="https://github.com/user-attachments/assets/0377640e-0049-4e45-adb5-3eb2cdfd18d3" /> <img width="276" height="580" alt="Image" src="https://github.com/user-attachments/assets/12822431-538b-4d22-9fba-50b4d1083042" />
<img width="312" height="647" alt="Image" src="https://github.com/user-attachments/assets/0e0b2d0c-7732-43d1-b028-bc47f8c2edb4" />

   - 사용자 이름 클릭 시, 프로필 설정 화면으로 이동
   - AppBar 추가
   - Column 으로 배치, Padding으로 여백 
   - 이름 클릭 시 설정할 수 있는 페이지로 이동
   - 이름 30자 제한 
   - 이름 변경 후 확인 클릭 시 설정 변경
   - 프로필 사진 업로드 기능 공부 필요!
   - Container 공통 위젯으로 묶기
   - 프로필 사진을 설정하지 않은 경우 갤러리로 이동하여 프로필 사진 선택
   - 프로필 사진을 설정한 경우 프로필 사진 클릭 시 AlertDialog로 수정/삭제/취소 선택 가능
  
  1. Todo List 
   
  <img width="213" height="451" alt="Image" src="https://github.com/user-attachments/assets/83f1362c-d488-4bfc-b81f-5e2f6555e8b3" />
  <img width="336" height="703" alt="Image" src="https://github.com/user-attachments/assets/5176312f-6040-43ab-93d7-a05e99e91ffc" />

  - AppBar leading 위젯 popupmenubutton으로 필터 기능 추가
  - 프로필 사진과 이름 표시, 이름 클릭 시 프로필 설정 화면으로 이동
  - 각 항목은 List View + checkboxListTile으로 구현 
  - 항목별로 삭제/수정 가능
  - floatingActionButton으로 항목 추가 가능
  - showBottomModalSheet로 메모 추가, 임시저장 가능
  - 방법 1. (프로필 사진, 이름) (검색창) (리스트) 로 구성하고 리스트 제외한 위젯 사이즈를 정해준 뒤 리스트를 Expanded로 감싸줄 예정 → 

> 모델
1. 사용자 정보
   - **프로필 사진**, **이름**
   - 입력 받으면 UI에 표시 + 저장