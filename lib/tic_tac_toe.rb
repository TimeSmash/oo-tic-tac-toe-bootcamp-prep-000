class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  # _1_|_2_|_3_ 1 = [0] 2 = [1]
  # _4_|_5_|_6_
  # _7 | 8 | 9
  
  
  WIN_COMBINATIONS = [[0,1,2], [0,3,6], [0,4,8], [1,4,7], [2,5,8], [3,4,5], [6,7,8], [6,4,2]]

#######
def play
  until over?
  turn #keep asking for player input until game is over
  end
  if won?
    puts "Congratulations #{winner(@board)}!"
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
  display_board

  user_input = gets.strip #prompts input(cell desired) and stores that as a value 

  array_index = input_to_index(user_input) 
<<<<<<< HEAD

  if valid_move?(array_index)
    if turn_count % 2 == 0
    move(array_index, "X")
    display_board
    elsif !(turn_count % 2 == 0)
    move(array_index, "O")
    display_board
    end
=======
  #converts cell to array index

  if valid_move?(array_index)
    move(array_index, "X")
    display_board
>>>>>>> 6d0daffcf931bc8729d88a17485c3cee48ff38d5
  else
    turn(@board) #asks again via recursion
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
  if (turn_count(@board) % 2 == 0)
    return "X"
  elsif !(turn_count(@board) % 2 == 0)
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
<<<<<<< HEAD
  if !won?(@board) && full?(@board)
=======
  if !won?(@board) && ( full?(@board) || !full?(@board) )
>>>>>>> 6d0daffcf931bc8729d88a17485c3cee48ff38d5
    true
  elsif !won?(@board)
    false
  end
end

def over?
<<<<<<< HEAD
  if (won?(@board) && full?(@board)) || (won?(@board) && !full?(@board)) || draw?(@board)
=======
  if ( won?(@board) && ( (full?(@board) || !full?(@board) ) ) ) || draw?(@board)
>>>>>>> 6d0daffcf931bc8729d88a17485c3cee48ff38d5
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
  if won?(@board) && won?(@board).all? {|ele| @board[ele] == "X"}
    return "X"
  elsif won?(@board) && won?(@board).all? {|ele| @board[ele] == "O"}
    return "O"
  end
  nil
end
end