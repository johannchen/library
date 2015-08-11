require "test_helper"

class MybooksTest < Capybara::Rails::TestCase
  test "list my books" do
    user = users(:johann)
    login(user)
    assert_content page, "Johann Chen"
    assert_content page, "ESV Bible"
    assert_content page, "Four Loves"
    refute_content page, "Surprised By Joy"
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
