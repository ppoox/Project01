### scp, ssh, rsync 같은 두 인스턴스간에 연결시 비밀번호 입력없이 사용하기

1. 키생성
   `ssh-keygen -t rsa -b 2048`

2. 키생성시 키를 생성할 경로를 물어본다.(계정에 따라 default 경로가 다르다)
   지정한 경로와 키명에 따라 3번의 커맨드를 수정하여 입력

3. 공개키 연결할 서버에 전송(`~/`는 홈 디렉토리를 뜻함)
   `ssh-copy-id -i ~/.ssh/id_rsa.pub remote-host`

4. knowns에 연결서버 호스트가 등록

-   계정 및 sudo 명령어 여부에 따라 knowns파일이 /root/.ssh 또는 ~/.ssh 등 권한에 따라 달라지니 주의

-   *ssh-copy-id*가 없거나(Windows) _ssh-copy-id_ 실행이 어려운경우 수동으로 공개키 복사
    `scp id_rsa.pub myId@remote-host:/home/myId`
    `cat id_rsa.pub >> ~/.ssh/authorized_keys`

5. 원격지의 *~/.ssh/authorized_keys*에서 공개키를 확인할 수 있다.

6. 권한변경
   chmod 700 ~/.ssh
   chmod 600 ~/ssh/authorized_keys

-   ssh 로그인 실패 원인은 /var/log/secure에서 조회 가능

[참고](https://www.lesstif.com/lpt/scp-ssh-rsync-12943452.html)
