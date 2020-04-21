require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "----------------"
puts "Welcome to Mario Kart !"
puts "Select your player"
puts "----------------"

puts "Quel est ton prénom ?"
name_user = gets.chomp

human = HumanPlayer.new("#{name_user}")

ennemies = []

player1 = Player.new("Josiane")
ennemies << player1

player2 = Player.new("José")
ennemies << player2

while human.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)

    puts "Voici l'état de l'humain" 

    human.show_state

    puts "========================"

    puts "Quelle action veux-tu effectuer ?

    a - chercher une meilleure arme
    s - chercher à se soigner 
    
    attaquer un joueur en vue :
    0 - #{player1.show_state}  
    1 - #{player2.show_state}" 

    case gets.chomp 
        when "a"
            human.search_weapon
        when "s"
            human.search_health_pack
        when "0"
            human.attacks(player1)
        when "1" 
            human.attacks(player2)
        else puts "Mauvaise option. Essaye encore"
        
    end
    
    puts "Les autres joueurs t'attaquent !"

    ennemies.each do |player| 
        if player.life_points > 0
            player.attacks(human) 
        end
    end
 
end

if human.life_points > 0
    puts "BRAVO ! TU AS GAGNE !" 
else puts "Loser ! Tu as perdu !" 
end 


