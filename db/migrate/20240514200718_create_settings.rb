class CreateSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :settings do |t|
      t.text :rules

      t.timestamps
    end
  end
end
