# Anyware👩‍💻


# Contents <br>
1. [개요](#star-개요)  
2. [Document](#star-document)
3. [팀 소개 및 주요 기능](#star-팀-소개-및-주요-기능)
4. [구현 기능](#star-구현-기능)
    - [메인페이지](#pushpin-메인페이지)
    - [주소록(개인주소록)](#pushpin-개인주소록)
    - [주소록(사내주소록)](#pushpin-사내주소록)
    - [메일쓰기](#pushpin-메일쓰기)
    - [나에게 메일쓰기](#pushpin-나에게쓰기)
    - [메일 임시저장](#pushpin-메일임시저장)
    - [수신확인](#pushpin-수신확인)
    - [메일보관함](#pushpin-메일보관함)   
    - [휴지통 메일](#pushpin-휴지통메일) 
    - [메일 답장/전달](#pushpin-메일답장전달)   
    - [메일 상세조회](#pushpin-메일상세조회) 

***

# :star: 개요
- 프로젝트명 : Anyware 그룹웨어 <br>

- 보고서 : 

- 기획 의도  <br>
  - 재택근무 증가로 인한 업무 플랫폼 도입 필요성  <br>
  - 구성원 간의 업무공유, 일정관리등을 통한 협업을 통해 업무의 효율성 높일 수 있도록 함<br>
  - 직관적이고 사용자 친화적인 그룹웨어 개발 필요 <br>

- 개발 환경 <br><br>
![Slide1](https://user-images.githubusercontent.com/115604577/228799972-b2de8904-fe2e-450f-ab2c-039d0d895587.jpg)<br>


# :star: document

- usecase 다이어그램
- 사용자 <br>
![usecase1](https://user-images.githubusercontent.com/115604577/228800498-bc037def-7ecb-406f-bde6-e93296fd9998.png) <br>
- 관리자<br>
![usecase2](https://user-images.githubusercontent.com/115604577/228800593-23af742b-bf67-4cba-833a-e90a3bddf060.png)<br>

- DB 설계(ERD Cloud) <br>
![erd](https://user-images.githubusercontent.com/115604577/228806723-a62a6193-4ab8-46cb-b84e-70568c284147.png)

***


# :star: 팀 소개 및 주요 기능

![image](https://user-images.githubusercontent.com/115604577/228805939-4bc7f529-cd1e-4d1e-9ea1-e960983d8615.png)


***
 
 
# :star: 구현 기능
### :pushpin: 메인페이지
![로그인 메인](https://user-images.githubusercontent.com/115604577/229528135-07383b9f-6d2a-4cbb-bb94-4b5d726695dd.gif)
- 구현기능 설명
   - 메뉴바 및 로그인페이지 제작
   - 최근 받은메일, 보낸메일 조회
   - 근태조회 ( 일별 출퇴근 기록 / 주,월간 총 근무시간조회)


### :pushpin: 개인주소록
![개인주소록](https://user-images.githubusercontent.com/115604577/229528754-bf094e60-6dcb-42e4-8b3c-96dd757dfc2d.gif)
- 구현기능 설명
   - 개인 연락처 추가/ 수정 / 삭제 
   - 체크박스 선택 후 삭제, 메일전송 가능 
   - 키워드 검색(이름, 부서, 직급등으로 검색)

![개인주소록 그룹 추가 ](https://user-images.githubusercontent.com/115604577/229529800-fd47b9e8-6b3e-42eb-b5b6-c039e01f375f.gif)
- 구현기능 설명
   - 그룹별 주소록 조회
   - 그룹 추가 / 수정 / 삭제

### :pushpin: 사내주소록
![사내주소록](https://user-images.githubusercontent.com/115604577/229530328-e8e6fe7c-7c9b-49be-9005-849e26a2d1c9.gif)
- 구현기능 설명
   - 사내 전직원 조회 , 부서별 조회
   - 키워드 검색(이름,부서, 직급등으로 검색)
   - 체크박스 선택 후 메일 전송기능
   
### :pushpin: 메일쓰기
![메일쓰기](https://user-images.githubusercontent.com/115604577/229532093-6f7662cd-a8bf-48ad-a098-78f3e1da1cd3.gif)
- 구현기능 설명
   - 메일 전송하기 
   - 받는사람,참조 주소록에서 선택가능
   - multiselect를 사용해 받는사람과 참조자 선택 또는 검색으로 선택가능 
   - 첨부파일은 5개까지 선택 가능하며 드래그앤 드랍으로 첨부가능
   - 메일 제목이 없을경우 확인후 전송  

### :pushpin: 나에게쓰기
![내게쓰기](https://user-images.githubusercontent.com/115604577/229533894-56dd0c01-93ca-4e6f-96cf-e5f785173a0a.gif)
- 구현기능 설명
   - 메일쓰기와 동일하게 전송 
   - 첨부파일 5개 제한 


### :pushpin: 메일임시저장
![메일 임시저장](https://user-images.githubusercontent.com/115604577/229534288-82aa2ff9-473c-46be-870c-f306860cc52d.gif)
- 구현기능 설명
   - 처음 임시저장시 insert / 그 이후부터는 update 되도록해서 임시저장이 한번만 되도록함
   - 임시저장함에서 메일 이어쓰기 기능
   - 임시저장함에서 다시 임시저장이 가능 
   - 임서저장함에서 메일 전송시 임시저장함에서 사라지고, 보낸메일함으로 이동 
   
### :pushpin: 수신확인
![수신확인](https://user-images.githubusercontent.com/115604577/229535929-ba10abfd-9664-4fe0-b43a-f389ce9b8f33.gif)
- 구현기능 설명
   - 보낸메일 수신확인기능
   - 상대방이 안읽은 메일일 경우만 발송취소 가능
   - 수신확인, 발송취소된 메일은 선택되지 않도록 처리 
   
### :pushpin: 메일보관함
![메일 리스트 조회](https://user-images.githubusercontent.com/115604577/229538382-759d6aed-8eda-40f7-a5df-a8d1fe9ab29d.gif)
- 구현기능 설명
   - 메일 읽음,안읽음 처리
   - 메일삭제
   - 메일 답장, 전달 기능 
   - 메일필터 - 안읽은메일 / 중요메일 / 첨부메일
   - 메일 키워드 검색 

### :pushpin: 휴지통메일 
![휴지통](https://user-images.githubusercontent.com/115604577/229539153-15f905fa-abd1-4e85-8746-bfe071b44d17.gif)
- 구현기능 설명
   - 휴지통 메일 복구 
   - 메일 완전삭제
   - 휴지통 비우기  

### :pushpin: 메일답장전달
![메일 전달 답장](https://user-images.githubusercontent.com/115604577/229540192-3f5d7ffc-da1b-4816-92b9-9b455aaf2f59.gif)
- 구현기능 설명
   - 메일 답장시 제목에 RE: 와 받는이에 보낸사람 이름 자동으로 입력됨
   - 기존 메일 내용이 표시 
   - 메일 전달시 제목에 FW: 와 첨부파일이 같이 전달됨 
    
### :pushpin: 메일상세조회
![메일 상세페이지](https://user-images.githubusercontent.com/115604577/229541025-443b22d4-68fa-40a4-9283-a3b505409676.gif)
- 구현기능 설명
   - 보관함별 메일 상세페이지 조회
   - 메일 답장
   - 메일 전달
   - 메일 삭제 

