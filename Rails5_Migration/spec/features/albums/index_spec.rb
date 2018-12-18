require 'rails_helper'

RSpec.feature 'Albums list' do
  scenario 'unauthenticated user' do
    visit albums_path
    within '#content' do
      expect(find('h1')).to have_content('Albums')
    end
  end
end