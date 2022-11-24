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
        @character.name = params[:character][:name]
        @character.exp = params[:character][:exp]
        @character.strength = 1 
        @character.dexterity = 1

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
