require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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

  scenario "They can click on a product and navigate to its page" do
    # ACT
    visit root_path
    have_button 'Detail'
    first('.product').click_on('Detail')

    # DEBUG
    #sleep(5)
    # save_screenshot
    # save_and_open_screenshot
  end

end
