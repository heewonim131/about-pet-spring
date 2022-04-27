# 🐶 어바웃펫-Spring
>### 반려동물 생활 플랫폼 어바웃펫 클론 코딩  
>[어바웃펫-JSP/Servlet 프로젝트](https://github.com/heewonim131/about-pet-jsp)를 Spring 프레임워크를 활용하여 재구성한 프로젝트

</br>

## 1. 제작 기간 & 참여 인원
- 2021.07.26 ~ 2021.08.13
- 5인 팀 프로젝트

</br>

## 2. 사용 기술
#### `Back-end`
  - Java 8
  - Spring Legacy 3.1.1
  - Maven
  - MyBatis 3.2.3
  - Oracle 11g

</br>

## 3. 담당 역할
|팀원|역할|
|:--|:--|
|임희원|회원 서비스|
|A(팀장)|펫TV, 펫스쿨 영상 서비스|
|B|펫로그 SNS 서비스|
|C, D|펫스토어 주문결제 서비스|

</br>

## 4. 구현 기능
구현을 담당한 기능은 회원가입, 로그인, 마이페이지 입니다.

### 4.1. 전체 흐름
![image](https://user-images.githubusercontent.com/92259017/156904889-ad99bb25-00af-4e15-8626-28e0702277f7.png)
  
### 4.2. 사용자 요청
![image](https://user-images.githubusercontent.com/92259017/156905347-ff243520-d1b2-421a-b9ad-9c611bda662a.png)
  
- **회원가입 폼 입력 체크** :pushpin: [코드 확인](https://github.com/heewonim131/about-pet-spring/blob/4e91c4d30efdba90c7a2c842a07af6ef6b27f8c9/src/main/webapp/Project/aboutPet/join.jsp#L667)
  - 회원가입에 필요한 정보들이 모두 입력되었는지 확인하고, POST로 요청합니다.
  
- **마이페이지 요청**
  - 회원의 마이페이지 화면을 GET 요청합니다.

### 4.3. Controller
![image](https://user-images.githubusercontent.com/92259017/156904935-10c45a11-023c-4218-92ef-af0fc1e46c17.png)
  
- **회원가입** :pushpin: [코드 확인](https://github.com/heewonim131/about-pet-spring/blob/4e91c4d30efdba90c7a2c842a07af6ef6b27f8c9/src/main/java/org/sist/AboutPet/controllers/JoinusController.java#L23)
  - 회원가입 요청이 처리되면 결과를 메인페이지로 응답합니다.

- **로그인** :pushpin: [코드 확인](https://github.com/heewonim131/about-pet-spring/blob/4e91c4d30efdba90c7a2c842a07af6ef6b27f8c9/src/main/java/org/sist/AboutPet/controllers/JoinusController.java#L36)
  - 로그인한 회원의 정보를 세션에 저장합니다.
  
![image](https://user-images.githubusercontent.com/92259017/156905337-e6a155be-e642-4124-908c-b4b3fa8f8a43.png)

- **마이페이지 요청 처리** :pushpin: [코드 확인](https://github.com/heewonim131/about-pet-spring/blob/4e91c4d30efdba90c7a2c842a07af6ef6b27f8c9/src/main/java/org/sist/AboutPet/controllers/MypageController.java#L37)
  - 로그인한 세션 사용자의 회원정보를 화면단에 응답합니다.
  
### 4.4. Repository
![image](https://user-images.githubusercontent.com/92259017/156905021-a77d8313-0a81-461c-9f4a-de48131e0128.png)
  
- **회원 저장** :pushpin: [코드 확인](https://github.com/heewonim131/about-pet-spring/blob/4e91c4d30efdba90c7a2c842a07af6ef6b27f8c9/src/main/java/org/sist/AboutPet/dao/SignUp.java#L13)
  - 회원 정보를 DB에 저장합니다.

![image](https://user-images.githubusercontent.com/92259017/156905036-537847ab-7f38-4f47-aa45-a1a3f4daa5d1.png)

- **마이페이지 조회** :pushpin: [코드 확인](https://github.com/heewonim131/about-pet-spring/blob/4e91c4d30efdba90c7a2c842a07af6ef6b27f8c9/src/main/java/org/sist/AboutPet/dao/MemberDao.java#L24)
  - DB로부터 마이페이지에 필요한 정보를 조회하는 쿼리를 수행합니다.

</br>
