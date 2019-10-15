require 'pry'

class Player
  attr_accessor :name
  attr_accessor :life_points

  def initialize(player_name)
  @name = player_name
  @life_points = 10  
  end

  def show_state
  #  return @life_points
    puts "#{self.name} à #{self.life_points} point(s) de vie"
  end

  def gets_damage(life_damage=3)
    self.life_points = self.life_points - life_damage
    if (self.life_points) <= 0 
      puts "le joueur #{self.name} à été tué !"
    else
    puts "#{self.name} n'a plus que #{self.life_points} point(s) de vie"
    end
  end

  def attacks(player) #joueur qui subit l'attaque
  puts "le joueur #{self.name} attaque le joueur #{player.name}"
  damage = compute_damage
  puts "et lui inflige #{damage} point(s) de dommage(s)"
  player.gets_damage(life_damage=damage)
  end

  def compute_damage
    return rand(1..6)
  end

end
