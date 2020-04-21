require 'pry'

class Player 

    attr_accessor :name, :life_points 

    def initialize (name_input)
        @name = name_input
        @life_points = 10
    end

    def show_state
        return "#{@name} a #{@life_points} points de vie"
    end

    def gets_damage(i)
        @life_points -= i 
        if @life_points <= 0
            puts "Le joueur #{name} a été tué"
        end
    end

    def attacks(looser)
        puts "#{name} attaque #{looser.name}"
        damage_looser = compute_damage
        looser.gets_damage(damage_looser)
        puts "il lui inflige #{damage_looser} points de dammage"
    
    end

    def compute_damage
        return rand(1..6)
    end

end

class HumanPlayer < Player 

    attr_accessor :weapon_level 

    def initialize(name_input)
        super(name_input)

        @life_points=100
        @weapon_level =1
        
        
        
    end

    def show_state
        puts "#{super} et une arme de niveau #{@weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon

        new_weapon_level=rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon_level}"

        if new_weapon_level> @weapon_level
            @weapon_level = new_weapon_level
            puts "Youhou ! Elle est meilleure que celle d'avant, prends la!"
        else puts "Badbeat, tu restes avec cette arme là"
        end

    end

    def search_health_pack

        random=rand(1..6)
        case random 
        when 1
            puts "Tu n'as rien trouvé"
        when 2..5
            @life_points = [100,@life_points+50].min
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        when 6
            @life_points = [100,@life_points+80].min
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
        end

    end

end




