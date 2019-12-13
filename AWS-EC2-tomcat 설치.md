## AWS EC2 ubuntu 18.04 환경에서 tomcat 설치하기

### 1. 인스턴스 최신화 및 시간  설정
> (1) 배포판 pacakage store에서 update 목록을 확인한다.    
> ```=> sudo apt-get update```    
> 
> (2) pacakage 최신화   
> ```=> sudo apt-get upgrade```    
>    
> (3) 리눅스 시간대 설정 Asia / Seoul 선택        
> ```=> sudo dpkg-reconfigure tzdata ```   
> 
> (4) 시간대 확인    
> ```=> sudo date ```   

### 2. java를 설치한다.
> 환경변수 설정까지 잘 설명되어 있는 [링크](https://all-record.tistory.com/181?category=733055)     
> 


### 3. tomcat을 설치한다.
> tomcat을 설치하는 방법에는 배포판을 통해 받을 수 있는 tomcat8과      
> 직접 [tomcat](https://tomcat.apache.org/)에 접속하여 다운로드 uri를 통하여 wget하는 방법이 있다.   
> 두개의 설치 방법에 따라 구동방법과 저장되는 경로가 다르다.
> 
> (1) ```=> sudo apt-get install tomcat8``` 로 설치하게 될 경우 /usr/share/tomcat8에 설치된다.
> 설치 : ```=> sudo apt-get install tomcat8```  
> 버전확인 : ```=> sudo /usr/share/tomcat8/bin/version.sh```
> 방화벽 설정 : **AWS 인스턴스일 경우 보안 그룹 >> 인바운드 >> 규칙에서 tomcat포트 설정**
> (일반 ubuntu linux일 경우 ```=> sudo ufw allow (톰캣 포트번호)/tcp```)    
> 상태확인 : ```=> ps -ef | grep tomcat```    
> 구동 : ```=> sudo service tomcat8 start```     
> 재시작 : ```=> sudo service tomcat8 restart```   
> 중지 : ```=> sudo service tomcat8 stop```    
> 
> (2) ```=> sudo wget 톰캣 다운로드 링크`` 로 설치하게 될 경우 tomcat을 설치할 directory에 가서 명령어를 실행해야한다.    
>
