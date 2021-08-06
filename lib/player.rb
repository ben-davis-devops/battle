class Player
  attr_reader :name
  attr_reader :hp

  DEFAULT_HP = 100
  def initialize(name)
    @name = name
    @hp = DEFAULT_HP
  end

  def attack(player)
    player.lose_hp
  end

  def lose_hp
    @hp -= 10
  end 

end
