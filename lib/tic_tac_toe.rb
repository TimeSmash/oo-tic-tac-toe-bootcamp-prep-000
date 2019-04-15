class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  # _0_|_1_|_2_ 1 = [0] 2 = [1]
  # _3_|_4_|_5_
  # _6 | 7 | 8
  
  
  WIN_COMBINATIONS = [[0,1,2], [0,3,6], [0,4,8], [1,4,7], [2,5,8], [3,4,5], [6,7,8], [6,4,2]]

#######
def play
  until over? || won?
  turn #keep asking for player input until game is over
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  if !position_taken?(index) && index.between?(0,8)
    return true
  else
    return false
  end
end

def input_to_index(num)
  converted_input = (num).to_i - 1
  return converted_input
end
  
def move(position, player_token) 
  @board[position] = player_token
  return display_board
end

def turn

  current_player
  
  user_input = gets.strip #prompts input(cell desired) and stores that as a value 

  array_index = input_to_index(user_input) 

  if valid_move?(array_index)
    if turn_count % 2 == 0
    move(array_index, "X")
    elsif !(turn_count % 2 == 0)
    move(array_index, "O")
    end
  else
    turn #asks again via recursion
  end
end

def turn_count
    turn = 0
    @board.each do |cell| # cell = element
      if cell == "X" || cell == "O"
        turn += 1
      else 
        turn += 0
      end
    end
  return turn
end

def current_player
  if (turn_count % 2 == 0)
    return "X"
  elsif !(turn_count % 2 == 0)
    return "O"
  end
end

def won?
  WIN_COMBINATIONS.each do |combo|
    
    win_index_1 = combo[0] # 0
    win_index_2 = combo[1] # 3 
    win_index_3 = combo[2] # 6
    pos_1 = @board[win_index_1] #board[0]
    pos_2 = @board[win_index_2] #board[3]
    pos_3 = @board[win_index_3] #board[6]
    
    if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
      return combo
    end
  end
    false
end

def full?
  #should return true IF all elements have X or O
  all_filled = @board.all? { |cell| cell == "X" || cell == "O"}
  if all_filled == true
    return true
  else
    false
  end
end

def draw?
  if !won? && ( full? || !full? )
    true
  elsif !won?
    false
  end
end

def over?
  if (won? && (full? || !full?)lea) || draw?
    #IF game won AND full board ==> game over
    #IF game won AND NOT full board ==> game over
    #IF game is draw (full,no winner) ==> game over
    true
  else
    false
  end
end
  
def winner
  #won? returns array of numbers
  #Need to take this array of indexes and iterate through it to see if board at those indexes equals X
  if won? && won?.all? {|ele| @board[ele] == "X"}
    return "X"
  elsif won? && won?.all? {|ele| @board[ele] == "O"}
    return "O"
  end
  nil
end
end
