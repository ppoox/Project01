## AWS EC2 apache가 셋팅된 인스턴스와 tomcat이 셋팅된 인스턴스를 연동한다.

> 연동정의
> WEB서버인 apache를 앞에 세우고 모든 요청을 받는다.
> apache는 80번 포트로 들어오는 http요청은 https로 리다이렉트 시킨다.
> ssl이 설정된 apache는 443번 포트로 들어오는 요청에 대해서
> 정적/동적 리소스를 구분하여 동적 리소스는 tomcat으로 보낸다.
> 
> ![connect1](https://user-images.githubusercontent.com/28284285/70771252-c209e000-1db3-11ea-8425-0a0e88889b94.PNG)     
>   


