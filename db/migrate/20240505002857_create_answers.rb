class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.references :egg, null: false, foreign_key: true, index: true
      t.references :user, null: false, foreign_key: true, index: true
      t.text :answer
      t.string :status, default: "pending", null: false
      t.datetime :submitted_at, null: false, default: -> { "CURRENT_TIMESTAMP" }, index: true

      t.timestamps
    end
  end
end
