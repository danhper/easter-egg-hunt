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
  has_many :hints

  default_scope { order(order: :asc) }
end
