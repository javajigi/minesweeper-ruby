=======
할일

* Bad smell 찾아 리팩토링 지속하기
  * grid_test에 많은 중복이 있는 듯하다. 중복 찾아서 제거해 보자.
  * x, y 좌표로 position 객체를 생성할 때 0 보다 작은 값일 경우 Exception을 throw 하는 것이 영 마음에 들지 않는다.
  * grid.rb의 row, column 메서드. 뭔가 찜찜하다. 여기도 뭔가 bad smell
  * grid.rb의 2차원 배열 생성하는 부분. 이 부분도 약간 냄새가 난다. 근데 뭔지는 잘 모르겠다.
  * grid.rb의 생성자에서 x, y로 접근하는 것이 영 기분 나쁘다.
  * 이외에도 엄청 많을 거야. 아직 소스 코드 양도 많지 않는데 소스 코드에서 너무 많은 bad smell이 난다. 내가 끝까지 추적해서 제거하고 말테다.

<WEEK3 에서 못다한 todo list>
* 지뢰위에 flag 꽂기
* 모든 지뢰에만 flag 꽂았을 때 게임 승
* Grid 초기화 할 때, mine 랜덤 설치

* 타이머
* 알고리즘 개선해서 square open 시 중복 접근 X

=======
완료

* grid.rb의 near_squares_each 메서드를 보면 position에서 x, y 값을 꺼내오고 있다. grid에서 x, y를 모두 제거하고 싶다.