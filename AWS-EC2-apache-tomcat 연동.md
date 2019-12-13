## AWS EC2 apache가 셋팅된 인스턴스와 tomcat이 셋팅된 인스턴스를 연동한다.

> 연동정의
> WEB서버인 apache를 앞에 세우고 모든 요청을 받는다.
> apache는 80번 포트로 들어오는 http요청은 https로 리다이렉트 시킨다.
> ssl이 설정된 apache는 443번 포트로 들어오는 요청에 대해서
> 정적/동적 리소스를 구분하여 동적 리소스는 tomcat으로 보낸다.
> 
> ![connect1](https://user-images.githubusercontent.com/28284285/70771252-c209e000-1db3-11ea-8425-0a0e88889b94.PNG)     
>   

> apache와 tomcat을 연동하는 방식에는 3가지가 있다.     
> 1. mod_jk 방식    
>> mod_jk 방식을 오래 써왔고 많이 사용하기 때문에 관련자료가 많고    
>> JkMount 옵션을 이용하면 URL이나 컨텐츠별로 유연한 설정이 가능    
>> 단점으로는 별도의 모듈을 설치해야하며 설정이 어렵다. 그리고 tomcat전용이다.    
>      
> 2. mod_proxy 방식   
>> 별도의 모듈 설치가 필요없고(apache 기본모듈) 설정이 간편하고 특정 WAS에 의존적이지 않다.    
>> 단점으로는 URL별 유연한 설정이 어렵다.(ProxyPassMatch 사용필요)      
>   
> 3. mod_proxy_ajp 방식     
>> 2번 방식과 동일
>  
**[자세한 내용 참고](https://www.lesstif.com/pages/viewpage.action?pageId=12943367)**     

#### 여기서는 1번 mod_jk 방식을 사용한다.     
 
### 1. 연동 커넥터 mod_jk 설치    
> ```=> sudo apt-get install libapache2-mod-jk```    

### 2. workers.properties 파일 생성     
> /etc/apache2/ 경로에 파일을 생성한다.  
> 
> ```=> sudo nano /etc/apache2/workers.properties```   
> 
>>    
>> workers.tomcat_home=톰캣경로       
>> workers.java_home=자바경로      
>> **아래와 같이 로드밸런스를 사용할 경우에는 worker.list에 로드밸런서명을 적어야한다**      
>> worker.list=워커이름1, 워커이름2   
>> worker.ajp13_worker.port=8009   
>> worker.ajp13_worker.host=톰캣서버 도메인 or 아이피   
>> worker.ajp13_worker.type=ajp13    
>> worker.ajp13_worker.lbfactor=1    
>> worker.loadbalancer.type=1b    
>> worker.loadbalancer.balance_workers=ajp13_worker     
>> 
> 
> ![workers1](https://user-images.githubusercontent.com/28284285/70771898-22018600-1db6-11ea-80c7-d6f2d61be88d.PNG)      
>        
> ![wokers2](https://user-images.githubusercontent.com/28284285/70771899-22018600-1db6-11ea-94f1-6e3eaef4534e.PNG)      

### 3. jk.conf에 workers.properties 파일 경로 수정    
> ```=> sudo nano /etc/apache2/mods-available/jk.conf```    
> **JkWorkersFile 경로 수정**    
>    
> ![jkconf](https://user-images.githubusercontent.com/28284285/70772557-3e062700-1db8-11ea-9b13-6af2c0446ab2.PNG)    
>    

### 4. VirtualHost 설정 변경    
> #### (1) SSL 설정이 되어있지 않은 경우에는 000-default.conf에 JkMount 설정 추가    
>> ```=> sudo nano /etc/apache2/sites-available/000-default.conf```   
>>    
>> ![000jkmount](https://user-images.githubusercontent.com/28284285/70772781-f6cc6600-1db8-11ea-8026-1af26fd69fbd.PNG)    
>>
>    
> #### (2) SSL이 설정되어 있는 경우에는 SSL VirtualHost설정파일에 JkMount 설정 추가     
>> ```=>sudo nano /etc/apache2/sites-available/default-ssl.conf```   
>> 
>> ![jkdefaultssl](https://user-images.githubusercontent.com/28284285/70772782-f6cc6600-1db8-11ea-9132-7319cc923633.PNG)    
>   
>

### JkMount를 이용해 어떤 리소스는 apache에서 처리할지, 어떤 리소스는 tomcat으로 넘겨줄지를 설정할 수 있다.   
> **JkMount /* worker명 또는 로드밸런스명**   =>   모든 리소스를 worker(tomcat)에게 넘기겠다는 의미    
> 무엇을 넘길지는상황에 따라 적용시킨다.   


### 5. tomcat server.xml 설정 변경    
> tomcat설치 하위의 conf 디렉토리로 이동한다.
> ```=> sudo su```    
> ```=> nano server.xml```    
> 주석해제   
>     
> ![serverxml](https://user-images.githubusercontent.com/28284285/70773205-24fe7580-1dba-11ea-979d-fe3e5afe053d.PNG)      
>   
>   


### 6. AWS 보안 그룹 포트 설정     
#### apache의 경우 인바운드 80, 443, 22 포트 개방    
#### tomcat의 경우 인바운드 8005, 8009 개방   



![result](https://user-images.githubusercontent.com/28284285/70774095-9808eb80-1dbc-11ea-9686-f23ed8ff07e4.PNG)



