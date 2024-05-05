class CreateEggs < ActiveRecord::Migration[7.1]
  def change
    create_table :eggs do |t|
      t.text :input
      t.integer :order

      t.timestamps
    end
  end
end
