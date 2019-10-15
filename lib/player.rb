require 'pry'
require 'bundler'
##################### début app 1.0 du jeu ######################
class Player
  attr_accessor :name
  attr_accessor :life_points

  def initialize(player_name)
  @name = player_name
  @life_points = 10  
  end

  def show_state
  #  return @life_points
  #if self.life_points < 0
   # life_points = 0
  # end
    puts "#{self.name} à #{self.life_points} point(s) de vie"
  end

  def gets_damage(life_damage=3)
    self.life_points = self.life_points - life_damage
    if (self.life_points) <= 0 
      puts "le joueur #{self.name} à été tué ! Il n'a plus de point de vie."
      puts " "
    else
    puts "#{self.name} n'a plus que #{self.life_points} point(s) de vie"
    puts " "
    end
  end

  def attacks(player) #joueur qui subit l'attaque
  puts " "
  puts "le joueur #{self.name} attaque le joueur #{player.name}"
  damage = compute_damage
  puts "et lui inflige #{damage} point(s) de dommage(s)"
  puts " "
  player.gets_damage(life_damage=damage)
  end

  def compute_damage
    return rand(1..6)
  end

end #of class

##################### fin app 1.0 du jeu ########################  

##################### début app 2.0 du jeu ######################
 
class HumanPlayer < Player
  attr_accessor :name
  attr_accessor :human_life_points
  attr_accessor :weapon_level

  def initialize(player_name="Josiane") #avec la méthode super
    @name = player_name
    @human_life_points = 100
    @weapon_level = 1
      #super(player_name)
  end

  def show_state
      puts "#{self.name} à #{self.human_life_points} point(s) de vie et une arme de niveau #{self.weapon_level}"
  end

  def compute_damage
      rand(1..6) * @weapon_level
  end

  def gets_damage(human_life_damage=3)
    self.human_life_points = self.human_life_points - human_life_damage
    if (self.human_life_points) <= 0 
      puts "le joueur #{self.name} à été tué !"
    else
    puts "#{self.name} n'a plus que #{self.human_life_points} point(s) de vie"
    puts " "
    end
  end

  def attacks(player) #joueur qui subit l'attaque
  puts " "
  puts " "
  puts "le joueur #{self.name} attaque le joueur #{player.name}"
  damage = compute_damage
  puts "et lui inflige #{damage} point(s) de dommage(s)"
  puts " "
  puts " "
  player.gets_damage(human_life_damage=damage)
  end

  def search_weapon
    initial_weapon_level = @weapon_level
    @weapon_level = rand(1..6) 
    puts ""
    puts "Tu as trouvé une arme de niveau #{self.weapon_level}"
      if self.weapon_level > initial_weapon_level
    puts "Super ! Cette arme est meilleure que ton arme actuelle : on la garde"
    puts " "  
    else 
      puts "ça ne vaut pas le coup de la changer, on garde et on continue"
    puts ""  
    @weapon_level = initial_weapon_level
      end 
  end

  def search_health_pack 
    dice_value = rand(1..6)
    initial_life_point = @human_life_points
    puts " "
    puts "Lançons les dés, tu as fait #{dice_value} :"
    case 
      when dice_value == 1
        puts ""
        puts " Tu n'as malheureusement rien trouvé"
        puts ""
      when dice_value == 2 || dice_value == 3 || dice_value == 4 || dice_value == 5
        @human_life_points = initial_life_point + 50
        if @human_life_points > 100
          @human_life_points = 100
        end
        puts ""
        puts " Tu as trouvé un pack de 50 points de vie !!"
        puts ""
        puts " #{self.name} a maintenant #{self.human_life_points} PV la partie n'est pas finie..."
        puts " "
      when dice_value == 6
        @human_life_points = initial_life_point + 80
        if @human_life_points > 100
          @human_life_points = 100
        end
        puts ""
        puts " Tu as trouvé un pack de 80 points de vie !!!!!! "
        puts ""
        puts " #{self.name} a maintenant #{self.human_life_points} PV, la partie n'est pas finie..."
        puts " "
    end
  end

end # of class 

##################### fin app 2.0 du jeu ######################## 
