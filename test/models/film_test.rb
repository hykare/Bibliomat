require 'test_helper'

class FilmTest < ActiveSupport::TestCase
  # validates :title, presence: true, length: {maximum: 100}
  # validates :director, presence: true, length: {maximum: 100}

  test "doesn't save film without title" do
    film = Film.new director: 'Harry pota'
    assert_not film.save
  end

  test "doesn't save film without director" do
    film = Film.new title: 'Kamień rzeczny'
    assert_not film.save
  end

  test "doesn't save film with title longer than 100" do
    film = Film.new title: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', director: 'Steven'
    assert_not film.save
  end

  test "save film with proper title and director" do
    film = Film.new title: 'Lord of the Rings', director: 'Steven Spielberg'
    assert film.save
  end

  # test "the truth" do
  #   assert true
  # end
end
