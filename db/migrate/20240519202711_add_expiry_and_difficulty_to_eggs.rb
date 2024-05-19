class AddExpiryAndDifficultyToEggs < ActiveRecord::Migration[7.1]
  def change
    add_column :eggs, :expiry, :datetime
    add_column :eggs, :difficulty, :string, default: "easy", null: false
  end
end
