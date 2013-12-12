================
Todo List

모든 지뢰에만 flag 꽂았을 때 게임 승
알고리즘 개선해서 square open 시 중복 접근 X
x, y를 객체로 뽑기 => 유효성 체크 리팩토링


- 게임에 전반적인 영역을 책임져줄 GameManager클래스를 생성.
- GameManager에게 설치된 mine정보를 전달해준다.
- GameManager에게 open한 스퀘어정보를 전달해준다.
- 게임의 승,패 여부를 GameManager를 통해서 확인한다.
================

지뢰위에 flag 꽂기
Grid 초기화 할 때, mine 랜덤 설치