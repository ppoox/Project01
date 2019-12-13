## AWS에 EC2 INSTANCE를 생성한다.

1. AWS의 서비스에서 EC2를 선택하고 원하는 환경의 운영체제를 선택한다.     
**시작하기전에 오른쪽 상단 계정명 옆에 지역설정을 원하는 지역으로 선택하고 시작한다.**     
![EC2생성1](https://user-images.githubusercontent.com/28284285/70759890-32e8d200-1d8b-11ea-8efa-e5adbd537834.PNG)       

2. 인스턴스 유형을 선택 할 수 있다. (프리티어 사용자는 t2.micro만 사용 가능하다)    
![EC2생성2](https://user-images.githubusercontent.com/28284285/70759891-32e8d200-1d8b-11ea-842e-0215ead5ee4b.PNG)

3. 인스턴스를 생성하기전에 설정들을 확인 하는 단계이다. (추후에 수정 가능하다)
![EC2생성3](https://user-images.githubusercontent.com/28284285/70759892-32e8d200-1d8b-11ea-9dad-04c64b52df05.PNG)     

4. 인스턴스 접속할때 키페어로 보안 설정을 할 수 있다.    
(1) 기존 키 페어가 없으면 "새 키 페어 생성"을 선택하고 키페어 이름을 입력한다.   
그리고 키페어 다운로드를 누르면 .pem 형식의 파일이 다운받아지게 되는데   
이는 다음 설명에서 puttygen프로그램을 사용하여.pem => .ppk로 변환하여 사용할 것이다.
     
(2) 기존 키 페어가 있으면 "기존 키 페어 선택"을 선택면 된다.    
![EC2생성4 키페어설정](https://user-images.githubusercontent.com/28284285/70759888-32503b80-1d8b-11ea-809a-27c538ce1b50.PNG)
     
(3) 키 페어를  사용하지 않으려면 "키 페어 없이 계속"을 선택하면 된다.    

5. 인스턴스를 생성하고 왼쪽 메뉴에 인스턴스를 누르면 인스턴스 목록이 나온다.    
인스턴스를 눌러보면 하단 설명탭에 퍼블릭DNS(IPv4), IPv4 퍼블릭 IP 등등 다양한 정보가 나온다.   
나중에 putty로 인스턴스에 접속할때 퍼블릭DNS나 IP가 필요하다.    
![EC2목록1](https://user-images.githubusercontent.com/28284285/70759893-32e8d200-1d8b-11ea-9f76-cf8fd63f7785.PNG)    
