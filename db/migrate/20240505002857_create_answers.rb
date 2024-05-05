class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.references :egg, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :answer

      t.timestamps
    end
  end
end
