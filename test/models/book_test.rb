require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "should not save book without title" do
    book = Book.new
    assert_not book.save, "Save the book without a title"
  end
end
