require_relative 'game_controller'

@gc = GameController.new
while true
  puts @gc.print
  puts '어느 곳을 열어보시겠습니까?'
  x, y = @gc.parse(gets)
  @gc.open(x, y)
end
