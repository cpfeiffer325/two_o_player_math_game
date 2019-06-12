class Interface
  def self.get_names
    print "Player 1 enter your name: "
    @p1 = gets.chomp
    print "Player 2 enter your name: "
    @p2 = gets.chomp
    [@p1, @p2]
  end
end