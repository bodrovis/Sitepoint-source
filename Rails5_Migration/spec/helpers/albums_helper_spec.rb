require 'rails_helper'

RSpec.describe AlbumsHelper do
  let(:popular_album) { build(:popular_album) }
  let(:ordinary_album) { build(:album) }

  context "#with_status" do
    it "should specially mark popular album" do
      result = helper.with_status(popular_album)
      expect(result).to have_selector("small", text: 'hot!')
    end

    it "should not mark ordinary album" do
      result = helper.with_status(ordinary_album)
      expect(result).not_to have_selector("small", text: 'hot!')
    end
  end
end