class Board
  def initialize
	@A1 = Cell.new
	@A2 = Cell.new
	@A3 = Cell.new
	@B1 = Cell.new
	@B2 = Cell.new
	@B3 = Cell.new
	@C1 = Cell.new
	@C2 = Cell.new
	@C3 = Cell.new
  end

  def head
  	puts "    1    2    3"
  end

  def line
  	puts "  ---------------"
  end

  def show
  	head
  	line
  	puts "A #{@A1.show}#{@A2.show}#{@A3.show}"
  	line
  	puts "B #{@B1.show}#{@B2.show}#{@B3.show}"
  	line
  	puts "C #{@C1.show}#{@C2.show}#{@C3.show}"
  	line
  end
end

class Cell
  def initialize
	 @val = " "
	 @changed? = false
  end

  def show
	return "| #{@val} |"
  end
end

game = Board.new
game.show