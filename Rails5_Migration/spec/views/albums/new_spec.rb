require 'rails_helper'

RSpec.describe "albums/new" do
  subject { build(:album) }

  before :each do
    assign(:album, subject)
    render
  end

  it "renders form with the proper id" do
    expect(rendered).to have_selector('#new_album', count: 1)
  end

  it "displays a page title" do
    expect(rendered).to have_selector('h1', text: 'New album')
  end
end