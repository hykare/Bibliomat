class ApplicationController < ActionController::Base
  before_action :set_selected_character

  def set_selected_character
    @selected_character = empty_character
    # if user logged in

    @selected_character = if session[:selected_character].present?
                            Character.find session[:selected_character]
                          else
                            current_user.characters.first!
                          end
  end

  private

  def empty_character
    Character.new id: 0, name: 'No character', level: 0
  end
end
