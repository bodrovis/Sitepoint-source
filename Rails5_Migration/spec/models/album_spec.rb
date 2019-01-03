# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  popular    :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe Album do
  subject {build(:album)}

  it { is_expected.to respond_to(:users) }
  it { is_expected.to respond_to(:cart_items) }

  context "scope" do
    describe ".popular" do
      let!(:popular_album) {create(:popular_album)}
      let!(:ordinary_album) {create(:album)}

      specify { expect(described_class.popular.size).to eq(1) }

      it "is expected not to include ordinary albums" do
        expect(described_class.popular).not_to include(ordinary_album)
        expect(described_class.popular).to eq([popular_album])
      end
    end
  end

  context "validation" do
    it "is not valid without a title" do
      subject.title = ''
      expect(subject).not_to be_valid
    end

    it "is not valid with a title longer than 100 symbols" do
      subject.title = 'a' * 101
      expect(subject).not_to be_valid
    end

    it "is valid with proper data" do
      expect(subject).to be_valid
    end
  end
end
