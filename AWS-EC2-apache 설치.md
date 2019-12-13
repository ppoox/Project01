## AWS EC2 Ubuntu 18.04 환경에서 apache를 구성한다.

#### 1. 배포판 pacakage store에서 update 목록을 확인한다.
```=> sudo apt-get update```    

#### 2. package 최신화
```=> sudo apt-get upgrade```    

#### 3. 리눅스 시간대 설정 Asia / Seoul 선택    
``` => sudo dpkg-reconfigure tzdata ```   

#### 4. 시간대 확인   
``` => sudo date ```   

#### 5. apache 설치(fedora와 centos는 apache2 대신 httpd)    
``` => sudo apt-get install apache2 ```   
  
#### 6. version 확인    
``` => sudo apache2 -v ```   

#### 7. 방화벽 80번 포트 허용  
**AWS 사용자는 해당 인스턴스 보안 그룹에서 설정**
``` => sudo ufw allow 80/tcp ```     

#### 8. 실행중인서비스확인     
``` => sudo service --status-all ```     

#### 9. 열려있는 포트 확인    
``` => sudo netstat -atlpvn ```

#### 10. apach2. 추가 보안설정  
> ``` => sudo nano /etc/apache2/apache2.conf ```     
>
> ![apache2 conf](https://user-images.githubusercontent.com/28284285/70769399-b2d36400-1dac-11ea-9ab5-ae1022acfd7d.PNG)      
> 아래에 추가로 작성      
>
>> ```
>> # deny file, folder start with dot
>> <DirectoryMatch "^\.|\/\.">
>>     Require all denied
>> </DirectoryMatch>
>>   
>> # deny (log file, binary, certificate, shell script, sql dump file) access.
>> <FilesMatch "\.(?i:log|binary|pem|enc|crt|conf|cnf|sql|sh|key|yml|lock|gitignore)$">
>>     Require all denied
>> </FilesMatch>
>>  
>> # deny access.
>> <FilesMatch "(?i:composer\.json|contributing\.md|license\.txt|readme\.rst|readme\.md|readme\.txt|copyright|artisan|gulpfile\.js|package\.json|phpunit\.xml|access_log|error_log|gruntfile\.js|bower\.json|changelog\.md|console|legalnotice|license|security\.md|privacy\.md)$">
>>     Require all denied
>> </FilesMatch>
>>  
>> # Allow Lets Encrypt Domain Validation Program
>> <DirectoryMatch "\.well-known/acme-challenge/">
>>     Require all granted
>> </DirectoryMatch>
>> ```
>
> **@nano editor 사용법         
>   @작성완료시 ctrl + x 누른 후 Y(변경사항 저장) 또는 N(변경하지 않고 저장) 입력      
>   @이후 파일명 수정여부 확인**   
>

#### 11. 인코딩 설정   
> ``` => sudo nano /etc/apache2/conf-available/charset.conf ```   
> AddDefaultCharset UTF-8 주석해제    
>     
> ![인코딩설정](https://user-images.githubusercontent.com/28284285/70769400-b36bfa80-1dac-11ea-8a38-4af2ed4d45cc.PNG)    
> 

#### 12. security.conf 추가 보안설정    
> ``` => sudo nano /etc/apache2/conf-available/security.conf ```     
>     
> ![시큐리티1](https://user-images.githubusercontent.com/28284285/70769397-b2d36400-1dac-11ea-8c63-bade99189be2.PNG)        
> 아래의 코드들 찾아서 작성, 수정 또는 주석해제
>
>> <Directory />
>> 	  AllowOverride None
>> 	  Require all denied
>> </Directory>
>
>> ServerTokens Prod
>
>> ServerSignature Off
>
>> TraceEnable Off
>

#### 13. apache 재시작   
> ``` => sudo service apache2 reload ``` 

**[apache설치 참고](https://blog.lael.be/post/73)**      

