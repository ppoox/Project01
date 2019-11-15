VS Code에 Spring Boot 설정
===========

### 개요
> 프로젝트에서 AA(Application Architecture)가 세팅해 주는건 STS(Spring Tool Suite) 까지였다.   
> script Tool 이나 환경 또는 DB Tool은 자신이 세팅이 가능했다.  
> STS를 사용하면서 .jsp파일이나 .js파일에서 javascript의 자동완성 기능이 없다.  
> 물론 Eclipse의 Market Place에서 Plugin으로 가능하지만 생각보다 버벅이는 느낌이 없지 않았다.  
> 또한 필자는 프론트 엔드쪽에 관심이 많기 때문에 평소에 VS Code(Visual Studio Code)를 좋아하고 자주 사용한다.  
> 그래서 개발시에도 VS Code를 이용하고자 미리 세팅을 해보기로 했다.  

### 기대효과
> 이번에는 VS Code에 Spring boot를 연동해서   
> 같은 Workspace를 바라보게 하여 VS Code에서는 .jsp 또는 .js 파일들을 작성 및 수정하고  
> JAVA나 Query 그리고 서버구동 및 테스트는 STS에서 하면서 개발하기 위함이다.   
> **이에따라 script의 자동완성 기능과 추가적으로 ESLint 환경을 구성하여   
문법 및 오탈자, 미사용 코드, 주석, 작성해논 TODO  줄이기 위함이다.**  

### 설치항목
> VS Code에서는 Plugin 같은 것들을 Extension이라고 한다.  
> VS Code를 키고 아래 사진 파란색 V표시를 누르면 Extensions를 설치하는 사이드 메뉴가 나온다.  
> 검색어에   
> **1. Spring Boot Extension Pack  
>   2. Spring Boot Tools   
>   3. Spring Initializr Java Support   
>   4. Spring Boot Dashboard   
>   5. Java Server Pages(JSP)   
>  이하 선택   
>  6. Lombok Annotations Support for VS Code (Lombok 사용시 필수)   
>  7. ESLint   
>  8. Visual Studio IntelliCode**       
> 위의 5가지 항목을 검색하여 설치하면 각각의 종속성 또는 확장팩에 들어이는 하위의 Extensions들도 같이 설치 된다.  
> (종속성을 가지고 있기 때문에 상위 Extension을 제거하기 전에는 하위 Extension은 삭제가 안된다.  

<hr/>

설치를 하고 난 다음 File에서 해당 Workspace를 열면   
해당 VS Code의 settings에 따라 문제에 다양한 경고 및 에러가 나오게 된다.     
해당 VS Code에서 Server를 구동시킬 수 있지만 Server는 STS에서 키고 작업하기 바란다.   
같은 Workspace를 바라 보고 있기 때문에 VS Code에서 코드를 작성해도  
별다른 작업없이 바로 열려져 있는 STS의 파일들이 바로 수정된다.   
script 수정이기 때문에 Ctrl + Shift + R을 눌러주면   
VS Code에서 작성한 내용이 STS에서 구동중인 웹페이지에도 적용이 된다.    
