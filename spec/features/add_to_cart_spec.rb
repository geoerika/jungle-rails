require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can click on the Add button and check if the Cart changes number of products" do
    # ACT
    visit root_path
    have_button 'Add'
    first('.product').click_on('Add')
    expect(page).to have_content 'My Cart (1)'
    puts page.html

    # DEBUG
    save_screenshot
    # save_and_open_screenshot
  end

end
