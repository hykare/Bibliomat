class QuestRewardsController < ApplicationController
  def reward
    # change to currently chosen character
    character = current_user.characters.first
    # can depend on: quest level, quest/character level ratio, randomness?
    gained_exp = 100

    character.add_exp(gained_exp)
    character.save
    # sends 204 no content
  end
end
