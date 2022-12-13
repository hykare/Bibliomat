class TavernController < ApplicationController
  def index
  end

  def ranking
    @top_characters = Character.order(level: :desc).first(20)
  end
end
