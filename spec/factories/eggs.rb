# == Schema Information
#
# Table name: eggs
#
#  id         :bigint           not null, primary key
#  input      :text
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :egg do
    sequence(:input) { |n| "egg input #{n}" }
    sequence(:order) { |n| n }
  end
end
