require 'rails_helper'

describe 'user can sign in' do
  it 'should allow user to receive an email when signing up' do

    # As a guest user
    # When I visit "/"
    visit '/'
    # And I click "Register"
    save_and_open_page
    click_on 'Register'
    # Then I should be on "/register"
    expect(current_path).to eq('/register')
    email ='test@email.com'
    name = '$2Sal'
    password = 'password'
    # And when I fill in an email address (required)
    fill_in 'user[email]', with: email
    # And I fill in name (required)
    fill_in :name, with: name
    # And I fill in password and password confirmation (required)
    fill_in :password, with: password
    # And I click submit
    click_on 'Submit'
    # Then I should be redirected to "/dashboard"
    expect(current_path).to eq('/dashboard')
    # And I should see a message that says "Logged in as <SOME_NAME>"
    expect(page).to have_content("Logged in as #{name}")
    # And I should see "This account has not yet been activated. Please check your email."
    expect(page).to have_content("This account has not yet been activated. Please check your email.")
    expect(User.find_by(name: name).verified).to be_false
  end
end
