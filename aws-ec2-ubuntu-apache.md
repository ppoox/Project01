### AWS EC2 Ubuntu 18.04 이용

apache 설정    
* 참고 : https://blog.lael.be/post/73    

1. 배포판 app store를 update 해준다.   
``` => sudo apt-get update ```    

2. 리눅스 시간대 설정 Asia / Seoul 선택    
``` => sudo dpkg-reconfigure tzdata ```   

3. 시간대 확인   
``` => sudo date ```   

4. apache 설치(fedora와 centos는 apache2 대신 httpd)    
``` => sudo apt-get install apache2 ```   
  
5. version 확인    
``` => sudo apache2 -v ```   

6. 방화벽 80번 포트 허용   
``` => sudo ufw allow 80/tcp ```     

7. 실행중인서비스확인     
``` => sudo service --status-all ```     

8. 열려있는 포트 확인    
``` => sudo netstat -atlpvn ```

9. AWS apache WEB 보안그룹 인바운드 80포트 규칙추가

10. apach2 추가 보안설정  

> => sudo nano /etc/apache2/apache2.conf  
>
>> AccessFileName .htaccess  
>> 
>> <FileMatch "^\.ht">  
>> 	Requrie all denied  
>> </FileMatch>   
>> 
>
> 하위에 추가
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

11. 인코딩 설정   
``` => sudo nano /etc/apache2/conf-available/charset.conf ```   
> 아래의 코드 주석해제
>> AddDefaultCharset UTF-8

12. security.conf 추가 보안설정    
> ``` => sudo nano /etc/apache2/conf-available/security.conf ```   
> 아래의 코드 수정 또는 주석해제
>
>> <Directory />
>> 	  AllowOverride None
>> 	  Require all denied
>> </Directory>
>
>
>> ServerTokens Prod
>
>> ServerSignature Off
>
>> TraceEnable Off
>
>> Header set X-Content-Type-Options: "nosniff"
>
>> Header set X-Frame-Options: "sameorgin"
>

13. apache 재시작   
``` => sudo service apache2 reload ```   

14. apache 서버의 sites 값 수정
``` => sudo nano /etc/apache2/sites-available/000-default.conf ```
> serverName '아이피주소 or 도메인 작성'


* 추후 추가 작성 할 것 => mod_jk를 이용한 tomcat 연동, SSL 인증서 적용, SSH 기본포트번호 변경, 방화벽 설정, 트랙픽 양 제한
> JkMount /* loadbalancer				=> tomcat으로 넘겨줄 파일 설정(추후 ssl적용시 default-ssl로 이동)
