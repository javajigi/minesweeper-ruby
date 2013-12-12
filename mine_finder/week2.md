================
Todo List

모두 지뢰인 경우 자동으로 win
승리조건 리팩토링
================
Complete List

Grid를 초기화한다. => row, col
(1, 1)이 지뢰이고, (1, 1)을 open하면 게임에 진다.
Grid 출력기능 완료.
open, setMine기능 리팩토링
잘못된 위치의 square를 참조하고자 할 경우에는 IndexOutOfBoundError을 발생시킨다.
(0, 0)에 지뢰를 설치할 때 주변 square의 주변 지뢰 숫자가 1씩 증가한다.
(1, 1)이 지뢰이고, (0, 0)을 open하면 주변의 지뢰 숫자가 공개된다.

모두 지뢰가 아닌 경우 특정 위치 하나를 open하면 모든 square가 open된다.
- 주변의 square를 모두 가져오는 함수를 구현한다.
- mine!함수에서 주변 square의 near_mine_num증가 부분 리팩토링.
- 해당 square를 모두 돌며 near_mine_num이 0일 경우 재귀적으로 open한다.
반복되는 for문 리팩토링