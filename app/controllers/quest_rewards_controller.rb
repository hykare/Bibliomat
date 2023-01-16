class QuestRewardsController < ApplicationController
  def reward
    # change to currently chosen character
    character = Character.find session[:selected_character]
    # can depend on: quest level, quest/character level ratio, randomness?
    gained_exp = 100
    # returns true if character leveled up
    character.progress_level(gained_exp)
    character.save
    # sends 204 no content
  end
end
