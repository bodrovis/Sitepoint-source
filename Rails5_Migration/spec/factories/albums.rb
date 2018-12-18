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

FactoryGirl.define do
  factory :album do
    title Faker::Book.title

    trait :popular do
      popular true
    end

    factory :popular_album, traits: [:popular]
  end
end
