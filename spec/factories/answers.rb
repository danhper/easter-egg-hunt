# == Schema Information
#
# Table name: answers
#
#  id           :bigint           not null, primary key
#  egg_id       :bigint           not null
#  user_id      :bigint           not null
#  answer       :text
#  status       :string           default("pending"), not null
#  submitted_at :datetime         not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :answer do
    sequence(:answer) { |n| "answer #{n}" }

    egg
    user
  end
end
