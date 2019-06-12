class Game
  def initialize(opts)
    @player_controller = opts[:player_controller]
    @question_controller = opts[:question_controller]
    @interface = opts[:interface]
  end

  def switch_player
    @current_player = @current_player.name == @player1.name ?
    @player2 : @player1
  end
  
  def play
    names = @interface.get_names
    @player1 = @player_controller.new(names[0])
    @player2 = @player_controller.new(names[1])
    @current_player = @player1
    
    loop do
      question = @question_controller.new()
      puts "#{@current_player.name}: #{question}"
      print"> "
      @response = gets.chomp.to_i
      
      if question.check_answer(@response)
        puts "YES! You are correct"
      else
        @current_player.lose_life
        puts "Seriously? No!"
      end
      
      if @current_player.lives.to_i == 0
        switch_player
        puts "#{@current_player.name} wins with a score of #{@current_player.lives}/3"
        puts "------ GAME OVER ------"
        puts "Good Bye"
        break    
      else 
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        puts "------ NEW TURN------"
        switch_player
      end      
    end    
  end
end

