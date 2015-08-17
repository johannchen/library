require "test_helper"

class BorrowBookTest < Capybara::Rails::TestCase
  test "johann request a book from meilin" do
    user = User(:johann)
    login(user)
    fill_in "search_box", with: "forever"
    click_button "Request book"
    # check email is sent
  end

  test "meilin accepts book request from johann" do
    user = User(:meilin)
    login(user)
    assert_content page, "johann@mail.com"
    assert_content page, "Accept"
    assert_content page, "Deny"
    #click_button "Accept"
  end
end
