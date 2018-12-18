# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  album_id   :integer
#  quantity   :integer          default(1), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe CartItem do
  subject { build_stubbed(:cart_item) }

  context "validation" do
    it "is valid with valid with proper attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without a user" do
      subject.user = nil
      expect(subject).not_to be_valid
    end
    it "is not valid without an album" do
      subject.album = nil
      expect(subject).not_to be_valid
    end

    context "duplicating records" do
      let!(:duplicating_cart_item) { create(:cart_item, user: subject.user, album: subject.album) }

      it "is not valid with duplicating user or album" do
        expect(subject).not_to be_valid
      end
    end
  end
end
