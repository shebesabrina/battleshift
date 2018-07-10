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
    
    expect(confirmation_email).to have_link("Visit here to activate your account.",
                                             )
    visit edit_verification_url(user)
    expect(current_path).to eq(confirmation_path)
    expect(page).to have_content("Thank you! Your account is now activated.")

    visit '/dashboard'

    expect(page).to have_content('Status: Active')
    # As a non-activated user
    # When I check my email for the registration email
    # I should see a message that says "Visit here to activate your account."
    # And when I click on that link
    # Then I should be taken to a page that says "Thank you! Your account is now activated."

    # And when I visit "/dashboard"
    # Then I should see "Status: Active"
    end
  end
end
