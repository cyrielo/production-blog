module Features
  module SessionHelpers
    def signup_with(email, password)
      visit signup_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign up'
    end

    def signin
      user = create(:user)
      visit signin_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end
  end
end
