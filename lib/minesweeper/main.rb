require_relative 'game_controller'

@gc = GameController.new
while true
  puts @gc.print
  puts '어느 곳을 열어보시겠습니까?'
  @gc.open(gets)
  input = gets
  x, y = input.split(', ')
  puts x, y
end
