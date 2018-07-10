require 'rails_helper'

describe 'Registered User' do
  it 'should be able to login' do
    visit '/'

    click_on 'Login'

    email = 'something@gmail.com'
    password =  'password'

    fill_in :email, with: email
    fill_in :password, with: password
    click_on 'Ready to Battle!'

    expect(current_path).to eq(dashboard)
  end

  it 'should be able to logout' do
    visit '/'

    click_on 'Login'

    email = 'something@gmail.com'
    password =  'password'

    fill_in :email, with: email
    fill_in :password, with: password
    click_on 'Ready to Battle!'

    click_on 'Log out'
    
    expect(current_path).to eq(root_path)
  end
end
