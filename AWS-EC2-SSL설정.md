## AWS EC2 Ubuntu 18.04 인스턴스에 설치되어있는 apache에 SSL을 설정한다.

> SSL 발급 받는 방식에는 여러가지가 있지만 여기서는 무료로 테스트 가능한 SSL을 기술한다.    
> 첫번째로 Ubuntu Apache 웹서버의 경우 자동으로 자가서명인증서(Self-Signed SSL)을 생성하고 기본사이트를 구동합니다.    
> 두번째는 openSSL을 이용하여 CSR과 private key 를 발급 받는다.   
> 세번째는 letsEncrypt를 이용하여 무료 인증서를 발급받는 방식이다.    

### 1. Ubuntu Apache환경일 경우     
#### (1) 기본으로 생성된 ssl 이용    
```=> sudo a2ensite default-ssl```       

#### (2) apache 재시작    
```=> sudo service apache2 reload```    

**[1번 방식 참고](https://blog.lael.be/post/7147)**     
     
    
### 2. openSSL을 이용할 경우    
#### (1) 인증파일을 저장할 directory를 생성/이동    

#### (2) openSSL 인증서 발급
> ```=> openssl req -x509 -newkey rsa:4096 -keyout **apache.key** -out **apache.crt** -days 365 -nodes```       
> 굵은 글씨로 표현된 .key파일과 .crt파일명은 각자 알맞게 설정한다.    
> 위 명령어를 입력하면 아래와 같은 순서로 인증서 정보를 입력받는다.
>> Country Name (2 letter code) [AU]: KR   
>> State or Province Name (full name) [Some-State]: FL   
>> Locality Name (eg, city) []: Seoul   
>> Organization Name (eg, company) [My Company]: test company    
>> Organizational Unit Name (eg, section) []:   
>>    
>> **common name에는 서버의 도메인 또는 IP를 입력한다.**    
>> Common Name (e.g. server FQDN or YOUR name) []: 192.168.2.3   
>> Email Address []:dummy@example.com   
>>  

#### (3) AWS 인스턴스 보안 그룹에서 인바운드 443번 포트 개방    

#### (4) default-ssl.conf 파일 설정    
> 해당 파일은 443번 포트 Virtual Host 설정 파일로 기본 SSL이 설정되어있다.
> ```=> sudo nano /etc/apache2/sites-available/default-ssl.conf```     
> 파일을 열어서 **ServerAdmin**에는 관리자 이메일을, **ServerName**에는 현재 서버의 도메인 또는 IP를 설정해준다.    
> **SSLCertificateFile**과 **SSLCertificateKeyFile**을 openSSL로 생성해낸 파일 경로로 바꿔준다.    
> ![default-sslconf](https://user-images.githubusercontent.com/28284285/70770174-b7e5e280-1daf-11ea-9a01-3a1aa607c892.PNG)     
> 

#### (5) 000-default.conf 파일 설정    
> 해당 파일은 80번 포트 Virtual Host 설정 파일로 기본 접속 설정이 되어있다.     
> ```=> sudo nano /etc/apache2/sites-available/000-default.conf```      
> **serverName**과 http로 요청이 오면 https로 리다이렉트 해주는 **Redirect permanent**를 설정해준다.    
> ![000defaultconf](https://user-images.githubusercontent.com/28284285/70770175-b7e5e280-1daf-11ea-9ee3-6f93974051bb.PNG)    
>  




 
