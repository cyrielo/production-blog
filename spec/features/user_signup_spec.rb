require 'spec_helper'

# print 'env=>', ENV['RAILS_ENV']

RSpec.describe 'User sign up', type: :feature do
  scenario 'with valid email and password' do
    signup_with 'test@email.com', 'pass123'
    expect(page).to have_content('sign out')
  end

  scenario 'with invalid email and password' do
    signup_with 'invalid_mail@', 'pass123'
    expect(page).to have_content('sign in')
  end

  scenario 'with blank email password' do
    signup_with 'test@example.com', ''
    expect(page).to have_content('sign in')
  end

  def signup_with(email, password)
    visit '/users'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Sign up'
  end
end
