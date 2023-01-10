class CharactersController < ApplicationController
  def index
    @characters = current_user.characters
    @selected = session[:selected_character]
  end

  def show
    @character = if params[:id].nil?
                   current_user.characters.first!
                 else
                   Character.find params[:id]
                 end

    @statistic = @character.statistic
  end

  def create
    @character = Character.new
    @character.user = current_user
    @character.health = 100
    @character.exp = 0
    @character.level = 1

    @character.name = params[:character][:name]
    @character.character_class = params[:character][:class]
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

  def select
    if current_user.characters.exists?(params[:id])
      session[:selected_character] = params[:id]
      puts "> Set selected #{session[:selected_character]}"
    end
    redirect_to characters_path
  end

  private

  def default_statistic_params
    {
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
