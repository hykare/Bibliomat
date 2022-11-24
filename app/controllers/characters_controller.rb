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

    end

    def new
        @character = Character.new
    end
end
