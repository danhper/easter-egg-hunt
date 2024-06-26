# == Schema Information
#
# Table name: hints
#
#  id         :bigint           not null, primary key
#  egg_id     :bigint           not null
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Hint < ApplicationRecord
  belongs_to :egg

  delegate :input, to: :egg, prefix: true

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
  end
end
