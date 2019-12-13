## 이전에 생성한 EC2 INSTANCE에 putty와 puttygen을 사용하여 접속한다.

1. **[putty다운로드](https://www.putty.org/)** 으로 접속하여 사용자의 시스템 환경에 맞게 putty와 puttygen을 다운로드한다.     
> ![putty다운](https://user-images.githubusercontent.com/28284285/70760656-b0addd00-1d8d-11ea-9da7-4a36129d419b.PNG)    
> 

2. puttygen을 실행시키고 load를 눌러 인스턴스를 생성할 당시 받은 .pem의 키페어 파일을 선택한다.  
> .pem형식의 파일이 보이지 않으면 우측 하단에서 "All Files"를 선택후 찾는다.   
> 선택후 "Generate"를 누르면 프로그레스 바가 보이고, 끝나고 "Save private key"를 누르면 .ppk파일이 다운받아진다.   
> ![puttygen](https://user-images.githubusercontent.com/28284285/70760657-b1467380-1d8d-11ea-8a86-ec189f3059d0.PNG)   
> 

3. 다음으로는 putty를 실행시키고 Session설정을 먼저 해준다.
> 인스턴스를 어떤 운영체제를 사용했느냐에 따라 @앞에 오는 명칭이 달라진다. **[참고](https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/UserGuide/putty.html)**     
> "운영체제에 따른 명칭@생성한 인스턴스 DNS or IP"형태로 Host Name을 입력한다.   
> 추가로 밑에 Saved Sessions에 해당 인스턴스를 별칭을 정하여 입력하여 Save해두면 Load를 통해 쉽게 불러올 수 있다.
> **하지만 고정IP를 사용하지 않을경우 인스턴스 재가동시 DNS와 IP가 달라지니 주의를 요한다.**
> ![putty세션설정](https://user-images.githubusercontent.com/28284285/70760658-b1467380-1d8d-11ea-985b-89fe1b728b12.PNG)    
>   
> 다음으로는 왼쪽 Category에서  Connection >> SSH >> Auth를 들어간 후   
> "Browse.."를 눌러 아까 puttygen을 사용하여 생성한 .ppk 파일을 선택해준다.
> 그리고 "Open"을 누르면 인스턴스 접속이 가능하다.      
> ![putty키설정](https://user-images.githubusercontent.com/28284285/70760660-b1467380-1d8d-11ea-9e61-6191da9d8b6d.PNG)    
>    


**AWS EC2 INSTANCE에서는 보안상 root에 암호를 사용하지 않기권장하기 때문에 권한만 빌려 사용하시거나     
임시 root 비밀번호 발급받아 사용하셔야 합니다. [참고](https://aws.amazon.com/ko/premiumsupport/knowledge-center/set-change-root-linux/)**   


 



