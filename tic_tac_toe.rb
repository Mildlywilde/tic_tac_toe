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

  def change_cell(cell, to)
  	case cell
  	when "A1"
  		@A1.change(to)
  	when "A2"
  		@A2.change(to)
  	when "A3"
  		@A3.change(to)
  	when "B1"
  		@B1.change(to)
  	when "B2"
  		@B2.change(to)
  	when "B3"
  		@B3.change(to)
  	when "C1"
  		@C1.change(to)
  	when "C2"
  		@C2.change(to)
  	when "C3"
  		@C3.change(to)
  	else
  		puts "i don't think that's a cell"		
  	end
  end

  def won?
  	if @A1.val == @A2.val && @A1.val == @A3.val && @A1.val != :blank
  		return true
  	elsif @B1.val == @B2.val && @B1.val == @B3.val && @B1.val != :blank
  		return true
  	elsif @C1.val == @C2.val && @C1.val == @C3.val && @C1.val != :blank
  		return true
  	elsif @A1.val == @B1.val && @A1.val == @C1.val && @A1.val != :blank
  		return true
  	elsif @A2.val == @B2.val && @A2.val == @C2.val && @A2.val != :blank
  		return true
  	elsif @A3.val == @B3.val && @A3.val == @C3.val && @A3.val != :blank
  		return true
  	elsif @A1.val == @B2.val && @A1.val == @C3.val && @A1.val != :blank
  		return true
  	elsif @C1.val == @B2.val && @C1.val == @A3.val && @C1.val != :blank
  		return true
  	else
  		return false
  	end
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
	attr_reader :val
	attr_reader :change_counter
  def initialize
	 @val = :blank
	 @changed = false
	 @@change_counter = 0
  end

  def change(symbol)
  	if @changed == false
  		@val = symbol
  		@changed = true
  		@@change_counter += 1
  		next_player
  	else
  		puts "sorry, looks like that spot's taken"
  	end
  end

  def self.count
  	return @@change_counter
  end

  def show
    if @val == :blank
	  return "|   |"
	elsif @val == :cross
	  return "| X |"
	else 
	  return "| O |"
	end
  end
end

def next_player
	if $turn == "player1"
		$turn = "player2"
	else
		$turn = "player1"
	end
end


$turn = "player1"
game = Board.new
game.show

while game.won? == false do
	if $turn == "player1"
	  puts "Your move player 1"
	  game.change_cell(gets.chomp.upcase, :cross)
	else
	  puts "Your move player 2"
	  game.change_cell(gets.chomp.upcase, :naught)
	end
	game.show
	game.won?
	if Cell.count == 9
	  break
	end
end

if Cell.count == 9
	puts "No one wins!"
elsif $turn == "player2"
	puts "Player 1 has won the game!"
else 
	puts "Player 2 has won the game!"
end


