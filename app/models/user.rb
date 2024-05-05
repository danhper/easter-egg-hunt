# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  email      :string           not null
#  token      :string           not null
#  points     :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  before_create :generate_token

  private

  def generate_token
    self.token = SecureRandom.uuid
  end
end
