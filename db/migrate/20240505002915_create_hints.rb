class CreateHints < ActiveRecord::Migration[7.1]
  def change
    create_table :hints do |t|
      t.references :egg, null: false, foreign_key: true, index: true
      t.text :content

      t.timestamps
    end
  end
end
