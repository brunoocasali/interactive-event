class CreateModelsBasedOnEer < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, null: false, limit: 20
      t.string :description, limit: 255
      t.string :key, null: false, limit: 10

      t.timestamps null: false
    end

    create_table :users do |t|
      ## Database authenticatable
      t.string :email, limit: 50, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet :current_sign_in_ip
      t.inet :last_sign_in_ip

      ## Confirmable
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email

      ## Lockable
      t.integer :failed_attempts, default: 0, null: false
      t.string :unlock_token
      t.datetime :locked_at

      t.string :name, limit: 30
      t.string :phone, limit: 15
      t.references :role, index: true, foreign_key: true
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true

    create_table :events do |t|
      t.string :hash_tag, null: false, limit: 75
      t.string :title, null: false, limit: 75
      t.string :cover, limit: 255
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.integer :kind, null: false, index: true
      t.references :user, null: false, index: true, foreign_key: true
      t.text :services, array: true, default: []

      t.timestamps null: false
    end

    create_table :items, id: false do |t|
      t.string :id, null: false
      t.integer :service, index: true, null: false
      t.string :image_link, limit: 340
      t.references :event, index: true, foreign_key: true
      t.column :author_id, :bigint, index: true, foreign_key: true
      t.integer :status, index: true
      t.text :text

      t.timestamps null: false
    end

    create_table :authors, id: false do |t|
      t.column :id, :bigint, null: false, index: true
      t.integer :service, index: true, null: false
      t.string :name, null: false, limit: 50, default: ''
      t.string :avatar, limit: 255
      t.string :screen_name, limit: 40, default: ''
      t.string :profile_url, default: ''
    end

    add_index :items, :id, unique: true
    add_index :authors, [:id, :service], unique: true
  end
end
