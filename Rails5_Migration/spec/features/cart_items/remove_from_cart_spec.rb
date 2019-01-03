require 'rails_helper'

RSpec.feature 'Removing cart items' do
  let!(:user) { create(:user) }
  let!(:album) { create(:album) }

  scenario "quantity should decrement after removing one item" do
    create(:cart_item, user: user, album: album, quantity: 2)
    visit root_path
    within '#cart' do
      click_link('[ x ]')
    end
    within('#cart') { expect(find('li/.quantity').text.to_i).to eq(1) }
    expect_flash('The item has been removed!')
  end

  scenario "album should not appear in the cart after removing all the items" do
    create(:cart_item, user: user, album: album, quantity: 1)
    visit root_path
    within '#cart' do
      click_link('[ x ]')
    end
    within('#cart') { expect(page).not_to have_content(album.title) }
    expect_flash('The item has been removed!')
  end
end
