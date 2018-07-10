require 'rails_helper'

describe 'A User' do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  context 'after signing into the login page' do

    
    it 'should receive an email containing a link to verify their account' do
      visit '/'
      click_on 'Register'

      email ='test@email.com'
      name = '$2Sal'
      password = 'password'

      fill_in 'user[email]', with: email
      fill_in 'user[name]', with: name
      fill_in 'user[password]', with: password
      click_on 'Submit'

      user = User.find_by(name: name)
      confirmation_email = open_email(user.email)

      expect(confirmation_email).to have_link("Visit here to activate your account.",)

      visit edit_verification_url(id:user, verification_token:user.verification_token)
      
      expect(current_path).to eq(confirmation_path)
      expect(page).to have_content("Thank you! Your account is now activated.")

      visit '/dashboard'

      expect(page).to have_content('Status: Active')
    end

    it 'should contain an api key' do
      visit '/'
      click_on 'Register'

      email ='another@email.com'
      name = 'myname'
      password = 'password'

      fill_in 'user[email]', with: email
      fill_in 'user[name]', with: name
      fill_in 'user[password]', with: password
      click_on 'Submit'

      user = User.find_by(name: name)
      confirmation_email = open_email(user.email)
      expect(confirmation_email).to have_content("Your Api Key:#{user.api_token}")

    end

  end
end
