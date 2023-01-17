require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "doesn't save book without a title" do
    book = Book.new
    assert_not book.save
  end
end
