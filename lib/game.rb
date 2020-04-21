require 'pry'

class game 

    attr_accessor :human_player :ennemies 

    def initialize(human_player_input,nb_player)
        @human_player = human_player_input
        @ennemies = []
        for i in (1..nb_player)  
            {"player#{i}"} = Player.new("Player #{i}") 
            @ennemies << player 


end
