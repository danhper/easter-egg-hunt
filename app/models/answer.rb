# == Schema Information
#
# Table name: answers
#
#  id         :bigint           not null, primary key
#  egg_id     :bigint           not null
#  user_id    :bigint           not null
#  answer     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Answer < ApplicationRecord
  belongs_to :egg
  belongs_to :user

  has_one_attached :image
end
