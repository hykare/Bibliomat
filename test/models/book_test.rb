require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "doesn't save book without a title" do
    book = Book.new author: 'J.R.R. Tolkien', ISBN: '0123456789'
    assert_not book.save, 'Saved book without a title'
  end

  test "doesn't save book without an author" do
    book = Book.new title: 'Lord of the Rings', ISBN: '012-3-45-6789'
    assert_not book.save, 'Saved book without an author'
  end

  test "doesn't save book title over 100 characters long" do
    book = Book.new title: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus corporis maxime consequuntur voluptatum',
                    author: 'J.R.R. Tolkien', ISBN: '0123456789'
    assert_not book.save, 'Saved book with title over 100 characters'
  end

  test "doesn't save book without an ISBN identifier" do
    book = Book.new title: 'Lord of the Rings', author: 'J.R.R. Tolkien'
    assert_not book.save, 'Saved book without ISBN'
  end

  test "doesn't save book when the ISBN has less than 10 digits" do
    book = Book.new title: 'Lord of the Rings', author: 'J.R.R. Tolkien', ISBN: '012-3-45-67'
    assert_not book.save, 'Saved book without ISBN'
  end

  test "doesn't save book when the ISBN is between allowed lengths" do
    book = Book.new title: 'Lord of the Rings', author: 'J.R.R. Tolkien', ISBN: '012-3-45-6789-1'
    assert_not book.save, 'Saved book without ISBN'
  end

  test "doesn't save book when the ISBN has more than 13 digits" do
    book = Book.new title: 'Lord of the Rings', author: 'J.R.R. Tolkien', ISBN: '012-3-45-6789-123-45'
    assert_not book.save, 'Saved book without ISBN'
  end
end
