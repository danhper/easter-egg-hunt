# == Schema Information
#
# Table name: magic_links
#
#  id         :bigint           not null, primary key
#  token      :string
#  expires_at :datetime
#  used       :boolean          default(FALSE)
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MagicLink < ApplicationRecord
  belongs_to :user

  before_create :generate_token

  def expired?
    expires_at < Time.now
  end

  private

  def generate_token
    self.token = SecureRandom.uuid
  end
end
