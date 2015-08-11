require "test_helper"

class MybooksTest < Capybara::Rails::TestCase
  setup do
    user = users(:johann)
    login(user)
  end

  test "list my books" do
    assert_content page, "Johann Chen"
    within "#mybooks" do
      assert_content page, "ESV Bible"
      assert_content page, "Four Loves"
      refute_content page, "Surprised By Joy"
    end
    within "#borrowed_books" do
      assert_content page, "Surprised By Joy"
    end
  end

  test "search book" do
    fill_in 'search_box', with: "forever"
    click_button 'Search'
    within "#search_result" do
      assert_content page, "You and Me Forever"
    end
  end


  private
  def login(user)
    visit '/login'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Submit'
    assert_equal current_path, books_path
  end
end
