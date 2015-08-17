module TestHelpers
  def login(user)
    visit '/login'
    fill_in :email, with: user.email
    fill_in :password, with: user.name
    click_button 'Submit'
  end
end
