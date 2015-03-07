class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :hash_tag, null: false, limit: 30
      t.string :title, null: false, limit: 75
      t.string :image, limit: 45
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.integer :kind, null: false, index: true
      t.references :user, null: false, index: true

      t.timestamps null: false
    end

    add_foreign_key :events, :users
  end
end
