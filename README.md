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

   - 사용자 이름이나 자기소개 클릭 시, 프로필 설정 화면으로 이동
   - AppBar 추가
   - Column 으로 배치, Padding으로 여백 
   - 이름, 자기소개 컨테이너 클릭 시 설정할 수 있는 페이지로 이동
   - 이름은 30자, 자기소개는 50자 제한 
   - 이름과 자기소개 변경 후 확인 클릭 시 설정 변경
   - 프로필 사진 업로드 기능 공부 필요!
   - Container 공통 위젯으로 묶기
  
  2. Todo List 
   
  <img width="275" height="576" alt="Image" src="https://github.com/user-attachments/assets/b08a6779-3050-4d04-8882-d5e4f0b11dc8" />

  - AppBar title에 검색, leading에 popupmenubutton으로 필터 기능 추가
  - 프로필 사진과 이름 표시, 이름 클릭 시 프로필 설정 화면으로 이동
  - 각 항목은 List View + checkboxListTile으로 구현 
  - 항목별로 삭제 가능
  - floatingActionButton으로 항목 추가 가능
  