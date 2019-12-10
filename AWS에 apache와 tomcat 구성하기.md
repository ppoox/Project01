### AWS EC2 Ubuntu 18.04 이용

apache 설정   
* 참고 : https://blog.lael.be/post/73   

1. sudo apt-get update			=> app store update   

2. sudo dpkg-reconfigure tzdata		=> Asia / Seoul   

3. sudo date				=> 시간대 확인  

4. sudo apt-get install apache2		=> apache 설치(fedora, centos는 httpd)   
  
5. sudo apache2 -v			=> version 확인   
sudo ufw allow 80/tcp			=> 방화벽 등록   

6. sudo service --status-all		=> service 실행중인지 여부확인   

7. sudo netstat -atlpvn			=> port 확인  


8. AWS 보안그룹 인바운드 80포트 규칙추가   


9. apach2 추가 보안설정  

sudo nano /etc/apache2/apache2.conf  
   
AccessFileName .htaccess  


<FileMatch "^\.ht">  
	Requrie all denied  
</FileMatch>   

하위에 추가
```
# deny file, folder start with dot
<DirectoryMatch "^\.|\/\.">
    Require all denied
</DirectoryMatch>
  
# deny (log file, binary, certificate, shell script, sql dump file) access.
<FilesMatch "\.(?i:log|binary|pem|enc|crt|conf|cnf|sql|sh|key|yml|lock|gitignore)$">
    Require all denied
</FilesMatch>
  
# deny access.
<FilesMatch "(?i:composer\.json|contributing\.md|license\.txt|readme\.rst|readme\.md|readme\.txt|copyright|artisan|gulpfile\.js|package\.json|phpunit\.xml|access_log|error_log|gruntfile\.js|bower\.json|changelog\.md|console|legalnotice|license|security\.md|privacy\.md)$">
    Require all denied
</FilesMatch>
 
# Allow Lets Encrypt Domain Validation Program
<DirectoryMatch "\.well-known/acme-challenge/">
    Require all granted
</DirectoryMatch>
```



10. sudo nano /etc/apache2/conf-available/charset.conf

'AddDefaultCharset UTF-8' 			=> 주석해제

11. sudo nano /etc/apache2/conf-available/security.conf


' <Directory />
	AllowOverride None
	Require all denied
 </Directory> ',
'ServerTokens Prod',
'ServerSignature Off',
'TraceEnable Off',
'Header set X-Content-Type-Options: "nosniff"',
'Header set X-Frame-Options: "sameorgin"'	=> 주석해제


12. sudo service apache2 reload			=> apache 재시작

13. sudo nano /etc/apache2/sites-available/000-default.conf
JkMount /* loadbalancer				=> 톰캣으로 넘겨줄 파일 설정


* 추후 추가할 것 => SSL 인증서 적용, SSH 기본포트번호 변경, 방화벽 설정, 트랙픽 양 제한

