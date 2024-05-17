# == Schema Information
#
# Table name: answers
#
#  id         :bigint           not null, primary key
#  egg_id     :bigint           not null
#  user_id    :bigint           not null
#  answer     :text
#  status     :string           default("pending"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Answer < ApplicationRecord
  belongs_to :egg
  belongs_to :user

  delegate :name, to: :user, prefix: true
  delegate :input, to: :egg, prefix: true

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
  end

  default_scope { order(submitted_at: :asc) }

  scope :pending, -> { where(status: "pending") }

  def accepted?
    status == "accepted"
  end
end
