# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :user do
    transient do
      upcased true
    end

    name Faker::Name.name
    email { Faker::Internet.email(name) }

    after(:build) do |user, evaluator|
      user.email.upcase! if evaluator.upcased
    end
  end
end
