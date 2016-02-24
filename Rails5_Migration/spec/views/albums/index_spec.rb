require 'rails_helper'

RSpec.describe "albums/index" do
  subject { build(:album) }

  it "render _album partial for each album" do
    assign(:albums, [subject, subject])
    render
    expect(view).to render_template(partial: '_album', count: 2)
  end

  it "displays album's title" do
    assign(:albums, [subject])
    render
    expect(rendered).to include(subject.title)
  end
end