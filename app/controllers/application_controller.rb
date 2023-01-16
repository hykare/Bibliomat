class ApplicationController < ActionController::Base
  # before_action :set_selected_character

  # def set_selected_character
  #   @selected_character = empty_character

  #   return unless user_signed_in?

  #   session[:selected_character] = current_user.characters.first!.id unless session[:selected_character].present?

  #   @selected_character = Character.find session[:selected_character]
  # end

  # private

  # def empty_character
  #   Character.new id: 0, name: 'No character', level: 0, character_class: 'warrior'
  # end
end
