require "test_helper"

class GameTest < ActiveSupport::TestCase
  test "doesn't save game without a title" do
    game = Game.new studio: 'CD Projekt', publication_year: 2015
    assert_not game.save, 'Saved game without a title'
  end

  test "doesn't save game without studio" do
    game = Game.new title: 'Wiedźmin 3', publication_year: 2015
    assert_not game.save, 'Saved game without studio name'
  end

  test "doesn't save game without publication year" do
    game = Game.new title: 'Wiedźmin 3', studio: 'CD Projekt'
    assert_not game.save, 'Saved game without publication year'
  end

  test "doesn't save game with publication year in the future" do
    game = Game.new title: 'Wiedźmin 3', studio: 'CD Projekt', publication_year: (Time.now + 2.years)
    assert_not game.save, 'Saved game with a future publication year'
  end

  test "doesn't save game with publication year before 1900" do
    game = Game.new title: 'Wiedźmin 3', studio: 'CD Projekt', publication_year: 1899
    assert_not game.save, 'Saved game with publication year before 1900'
  end
end
