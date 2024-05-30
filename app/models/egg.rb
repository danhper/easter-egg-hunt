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
class Egg < ApplicationRecord
  has_many :hints, dependent: :destroy
  has_many :answers, dependent: :destroy

  default_scope { order(order: :asc) }
  scope :active, -> { where("expiry > ?", Time.current).or(where(expiry: nil)) }
  scope :expired, -> { where("expiry <= ?", Time.current) }

  def expired?
    expiry && expiry <= Time.current
  end

  def extra_points
    case difficulty
    when "easy" then 0
    when "medium" then 2
    else 4 # hard
    end
  end
end
