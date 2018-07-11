require 'rails_helper'

describe 'Registered User' do
  it 'should be able to login' do
    user = create(:user)
    visit '/'

    click_on 'Log in'
# save_and_open_page

    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_on 'Ready to Battle!'

    expect(current_path).to eq(dashboard_path)
  end

  it 'should be able to logout' do
    user = create(:user)
    visit '/'

    click_on 'Log in'

    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_on 'Ready to Battle!'

    click_on 'Log out'

    expect(current_path).to eq(root_path)
  end
end
