require "test_helper"

feature "BookCrud" do
  scenario "list my books" do
    visit books_path
    page.must_have_content "ESV Bible"
    page.must_have_content "Four Loves"
    page.wont_have_content "Surprised By Joy"
  end
end
