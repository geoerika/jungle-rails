require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
  before :each do
    @user = user.create! first_name: 'Ansel', last_name: 'Adams', email: 'a@adams.com', password: 'boo', password_confirmation: 'boo'

    scenario "They can login and then be shown the products list on the main page" do
    # ACT
    visit sessions_path
    save_screenshot
    # have_button 'Detail'
    # first('.product').click_on('Detail')

    # DEBUG
    #sleep(5)
    # save_screenshot
    # save_and_open_screenshot
  end

  end
end
