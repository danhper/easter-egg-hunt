class CreateMagicLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :magic_links do |t|
      t.string :token, index: { unique: true }
      t.datetime :expires_at, default: -> { "now() + INTERVAL '1' HOUR" }
      t.boolean :used, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
