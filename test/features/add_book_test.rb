require "test_helper"

class AddBookTest < Capybara::Rails::TestCase
  setup do
    user = users(:johann)
    login(user)
  end

  test "add book through search in this database" do
    fill_in "search_term", with: "pray"
    click_button "Search"
    within "#search_result" do
      assert_content page, "Too busy not to pray"
    end
    click_button "Add Book"
    within "#mybooks" do
      assert_content page, "Too busy not to pray"
    end
  end

#  test "add book through search google books" do
#    fill_in "search_box", with: "On Guard"
#    click_button "Search"
#    within "#search_result" do
#      assert_content page, "William Lane Craig"
#    end
#    click_button "Add Book"
#    #assert_equal current_path, books_path
#    within "#mybooks" do
#      assert_content page, "On Guard"
#    end
end
