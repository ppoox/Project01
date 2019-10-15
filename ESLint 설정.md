ESLint 설정
===========

Spring Tool Suite를 사용하여 프로젝트를 진행하면서  
javascript의 오타, 필요없는 선언 및 정의 하지 않아서 발생하는 에러들을 경험하였다.  
**이 문서는 앞으로 진행할 프로젝트에서 사용할 ESLint 세팅을 위함이지  
ESLint에 대한 설명이나 상세한 내용은 기술하지 않는다.**  

<hr/>

필자가 시도한 ESLint 설정 방법으로는 아래 세가지이다.

> 1. Visual Studio Code 이용
> 2. Eclipse IDE를 Tern IDE로 configuration하여 이용
> 3. IntelliJ 이용

위 방법들중 2번 방법이 사용하기에는 편해보였지만 생각보다 불편하고 
진행중인 프로젝트 설정을 바꾸는게 마음에 들지않았다.
그래서 가벼우면서 javascript의 문법체크만을 위한 목적에 맞춰
**1번 방법을 사용하기로 정하고 간단하게 설정방법과 필요 설정들을 기술한다.**

<hr/>

> 1. Visual Studio Code의 Extensions에서 ESLint를 설치한다.
> ![image](https://user-images.githubusercontent.com/28284285/66732360-9a22fc80-ee96-11e9-9e03-e9080568e0aa.png)    
> 
> 2. node가 설치 되었다는 가정하에 "npm install eslint" (global 설치시 "npm install -g eslint")
> 3. npm init           => package.json 생성됨
> 4. eslint --init      => .eslintrc.js 생성됨
> 5. Visual Studio Code의 기본설정(ctrl+,)이나 setting.json에서 설정을 추가한다.
> ![image](https://user-images.githubusercontent.com/28284285/66732545-5e3c6700-ee97-11e9-8781-f2d46aadd91f.png)    
> 
> 6. .eslintrc.js에서 rules에 설정추가    
> ![image](https://user-images.githubusercontent.com/28284285/66732911-b58f0700-ee98-11e9-9438-d7d5234baa52.png)    

      
**규칙 참고 =>** https://eslint.org/docs/rules/ 

