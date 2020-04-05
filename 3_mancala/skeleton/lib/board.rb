class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new() }
    self.place_stones
  end

  def place_stones
    @cups.each_with_index do | c, idx |
      unless idx == 6 || idx == 13
        4.times { c << :stone }
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 13
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def place_pieces(start_pos, player_cup, opponent_cup)
    count = @cups[start_pos].length
    @cups[start_pos] = []
    start_index = start_pos + 1

    while true

      break if count == 0
      c_index = start_index % 14
      unless c_index == opponent_cup
        @cups[c_index] << :stone
        count -= 1
      end
      start_index += 1 unless count == 0

    end
    start_index
  end

  def make_move(start_pos, current_player_name)
    player_cup = start_pos.between?(0, 6) ? 6 : 13
    opponent_cup = player_cup == 6 ? 13 : 6
    ending_index = self.place_pieces(start_pos, player_cup, opponent_cup)
    self.render
    self.next_turn(ending_index)
  end


  def next_turn(ending_cup_idx)
    c = @cups[ending_cup_idx]

    if c.nil?
      return :switch
    elsif c != 6 && c != 13
      return ending_cup_idx
    end
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
