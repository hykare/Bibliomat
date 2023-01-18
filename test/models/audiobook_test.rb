require "test_helper"

class AudiobookTest < ActiveSupport::TestCase
  test "doesn't save audiobook without title" do
    audiobook = Audiobook.new author: 'Harry pota', narrator: 'Hagrid'
    assert_not audiobook.save
  end

  test "doesn't save audiobook without autor" do
    audiobook = Audiobook.new title: 'Kamień rzeczny', narrator: 'Hagrid'
    assert_not audiobook.save
  end

  test "doesn't save audiobook without narrator" do
    audiobook = Audiobook.new title: 'Kamień rzeczny', author: 'Harry pota'
    assert_not audiobook.save
  end

  test "doesn't save audiobook with title longer than 100" do
    audiobook = Audiobook.new title: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', author: 'Steven'
    assert_not audiobook.save
  end

  test "save audiobook with proper title and author" do
    audiobook = Audiobook.new title: 'Lord of the Rings', author: 'Steven Spielberg', narrator: 'Jerzy'
    assert audiobook.save
  end

end
