class CharactersController < ApplicationController
    def show 

        if params[:id].nil?
            @id = current_user.id
        else
            @id = params[:id]
        end
        # @id = params[:id].nil? ? current_user.id : params[:id]
    end

    def show_character_by_id

    end

    def create
        
        @character = Character.new
        @character.user = current_user
        @character.health = 100
        @character.exp = 0
        
        @character.name = params[:character][:name]
        stat = Statistic.new strength: 1, dexterity: 1, stamina: 1, initiative: 1
        
        @character.statistic = stat
        if @character.save
            redirect_to character_path
          else
            render :new, status: :unprocessable_entity
        end

    end

    def new
        @character = Character.new
    end
end
