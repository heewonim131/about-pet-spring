# πΆ μ΄λ°μν«-Spring
>### λ°λ €λλ¬Ό μν νλ«νΌ μ΄λ°μν« ν΄λ‘  μ½λ©  
>[μ΄λ°μν«-JSP/Servlet νλ‘μ νΈ](https://github.com/heewonim131/about-pet-jsp)λ₯Ό Spring νλ μμν¬λ₯Ό νμ©νμ¬ μ¬κ΅¬μ±ν νλ‘μ νΈ

</br>

## 1. μ μ κΈ°κ° & μ°Έμ¬ μΈμ
- 2021.07.26 ~ 2021.08.13
- 5μΈ ν νλ‘μ νΈ

</br>

## 2. μ¬μ© κΈ°μ 
#### `Back-end`
  - Java 8
  - Spring Legacy 3.1.1
  - Maven
  - MyBatis 3.2.3
  - Oracle 11g

</br>

## 3. λ΄λΉ μ­ν 
|νμ|μ­ν |
|:--|:--|
|μν¬μ|νμ μλΉμ€|
|A(νμ₯)|ν«TV, ν«μ€μΏ¨ μμ μλΉμ€|
|B|ν«λ‘κ·Έ SNS μλΉμ€|
|C, D|ν«μ€ν μ΄ μ£Όλ¬Έκ²°μ  μλΉμ€|

</br>

## 4. κ΅¬ν κΈ°λ₯
κ΅¬νμ λ΄λΉν κΈ°λ₯μ νμκ°μ, λ‘κ·ΈμΈ, λ§μ΄νμ΄μ§ μλλ€.

### 4.1. μ μ²΄ νλ¦
![image](https://user-images.githubusercontent.com/92259017/165451558-7f494d0e-8ed6-40dd-baf6-70f63001c3c2.png)
  
### 4.2. μ¬μ©μ μμ²­
![image](https://user-images.githubusercontent.com/92259017/156905347-ff243520-d1b2-421a-b9ad-9c611bda662a.png)
  
- **νμκ°μ νΌ μλ ₯ μ²΄ν¬** :pushpin: [μ½λ νμΈ](https://github.com/heewonim131/about-pet-spring/blob/4e91c4d30efdba90c7a2c842a07af6ef6b27f8c9/src/main/webapp/Project/aboutPet/join.jsp#L667)
  - νμκ°μμ νμν μ λ³΄λ€μ΄ λͺ¨λ μλ ₯λμλμ§ νμΈνκ³ , POSTλ‘ μμ²­ν©λλ€.
  
- **λ§μ΄νμ΄μ§ μμ²­**
  - νμμ λ§μ΄νμ΄μ§ νλ©΄μ GET μμ²­ν©λλ€.

### 4.3. Controller
![image](https://user-images.githubusercontent.com/92259017/156904935-10c45a11-023c-4218-92ef-af0fc1e46c17.png)
  
- **νμκ°μ** :pushpin: [μ½λ νμΈ](https://github.com/heewonim131/about-pet-spring/blob/4e91c4d30efdba90c7a2c842a07af6ef6b27f8c9/src/main/java/org/sist/AboutPet/controllers/JoinusController.java#L23)
  - νμκ°μ μμ²­μ΄ μ²λ¦¬λλ©΄ κ²°κ³Όλ₯Ό λ©μΈνμ΄μ§λ‘ μλ΅ν©λλ€.

- **λ‘κ·ΈμΈ** :pushpin: [μ½λ νμΈ](https://github.com/heewonim131/about-pet-spring/blob/4e91c4d30efdba90c7a2c842a07af6ef6b27f8c9/src/main/java/org/sist/AboutPet/controllers/JoinusController.java#L36)
  - λ‘κ·ΈμΈν νμμ μ λ³΄λ₯Ό μΈμμ μ μ₯ν©λλ€.
  
![image](https://user-images.githubusercontent.com/92259017/156905337-e6a155be-e642-4124-908c-b4b3fa8f8a43.png)

- **λ§μ΄νμ΄μ§ μμ²­ μ²λ¦¬** :pushpin: [μ½λ νμΈ](https://github.com/heewonim131/about-pet-spring/blob/4e91c4d30efdba90c7a2c842a07af6ef6b27f8c9/src/main/java/org/sist/AboutPet/controllers/MypageController.java#L37)
  - λ‘κ·ΈμΈν μΈμ μ¬μ©μμ νμμ λ³΄λ₯Ό νλ©΄λ¨μ μλ΅ν©λλ€.
  
### 4.4. DAO
![image](https://user-images.githubusercontent.com/92259017/156905021-a77d8313-0a81-461c-9f4a-de48131e0128.png)
  
- **νμ μ μ₯** :pushpin: [μ½λ νμΈ](https://github.com/heewonim131/about-pet-spring/blob/4e91c4d30efdba90c7a2c842a07af6ef6b27f8c9/src/main/java/org/sist/AboutPet/dao/SignUp.java#L13)
  - νμ μ λ³΄λ₯Ό DBμ μ μ₯ν©λλ€.

![image](https://user-images.githubusercontent.com/92259017/156905036-537847ab-7f38-4f47-aa45-a1a3f4daa5d1.png)

- **λ§μ΄νμ΄μ§ μ‘°ν** :pushpin: [μ½λ νμΈ](https://github.com/heewonim131/about-pet-spring/blob/4e91c4d30efdba90c7a2c842a07af6ef6b27f8c9/src/main/java/org/sist/AboutPet/dao/MemberDao.java#L24)
  - DBλ‘λΆν° λ§μ΄νμ΄μ§μ νμν μ λ³΄λ₯Ό μ‘°ννλ μΏΌλ¦¬λ₯Ό μνν©λλ€.

</br>
