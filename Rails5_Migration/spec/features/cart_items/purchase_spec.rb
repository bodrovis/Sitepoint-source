require 'rails_helper'

RSpec.feature 'Purchasing' do
  context 'unauthenticated user' do
    let!(:album) { create(:album) }

    scenario 'should not be able to purchase anything' do
      visit root_path
      within '#albums' do
        expect(page).not_to have_link('Add to cart')
      end
    end
  end

  context 'authenticated user' do
    let!(:album) { create(:album) }
    let!(:user) { create(:user) }

    scenario 'should see his cart updated after adding an album' do
      visit root_path
      within '#albums' do
        click_link('Add to cart')
      end
      within '#cart' do
        expect(page).to have_content(album.title)
        expect(find('li/.quantity').text.to_i).to eq(1)
      end
      expect_flash('Album added to your cart!')
    end

    scenario 'should be able add album to cart' do
      visit root_path
      within '#albums' do
        click_link('Add to cart', match: :first)
      end
      expect_flash('Album added to your cart!')
    end

    scenario 'should be able to purchase items' do
      visit root_path
      within '#albums' do
        expect(page).to have_link('Add to cart')
      end
    end
  end
end