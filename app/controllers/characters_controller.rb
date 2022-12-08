class CharactersController < ApplicationController
    def index
        @characters = current_user.characters
    end
    
    def show 

        if params[:id].nil?
            @character = current_user.characters.first! 
        else
            @character = Character.find params[:id]
        end

        @statistic = @character.statistic 

    end

    def create
        
        @character = Character.new
        @character.user = current_user
        @character.health = 100
        @character.exp = 0
        @character.level = 0
        
        @character.name = params[:character][:name]
        stat = Statistic.new default_statistic_params

        @character.statistic = stat
        if @character.save
            redirect_to @character
          else
            render :new, status: :unprocessable_entity
        end

    end

    def new
        @character = Character.new
    end

    private
    def default_statistic_params
        return {  
            strength: 1,
            dexterity: 1, 
            stamina: 1, 
            initiative: 1, 
            
            added_strength: 0, 
            added_dexterity: 0, 
            added_stamina: 0, 
            added_initiative: 0
        }
    end

end
