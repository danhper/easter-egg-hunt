# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  email      :string           not null
#  points     :integer          default(0), not null
#  admin      :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  attr_accessor :remember_token

  scope :admin, -> { where(admin: true) }
  default_scope { order(points: :desc) }

  def remember
    self.remember_token = SecureRandom.urlsafe_base64
    update_attribute(:remember_digest, BCrypt::Password.create(remember_token))
  end

  def authenticated?(remember_token)
    remember_digest && BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
