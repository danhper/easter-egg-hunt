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
require "rails_helper"

RSpec.describe Answer, type: :model do
  let(:user) { create(:user) }
  let(:egg) { create(:egg) }
  let(:answer) { create(:answer, user:, egg:) }

  describe "on update" do
    it "should do nothing if the status is not changed" do
      expect(answer).not_to receive(:update_user_points)
      answer.update(answer: "hello")
    end

    it "should update the user points if the status is changed to accepted" do
      expect(answer).to receive(:update_user_points)
      answer.update(status: "accepted")
    end

    it "should compute the number of points correctly" do
      create_list(:user, 3)
      create(:answer, status: "accepted", egg:)
      answer.update(status: "accepted")
      expect(user.reload.points).to eq(4)
    end
  end
end
