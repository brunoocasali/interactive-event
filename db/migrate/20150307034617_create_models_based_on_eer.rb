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
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false
      t.string   :unlock_token
      t.datetime :locked_at

      t.string :name, limit: 30
      t.string :phone, limit: 15
      t.references :role, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true

    create_table :events do |t|
      t.string :hash_tag, null: false, limit: 30
      t.string :title, null: false, limit: 75
      t.string :image, limit: 225
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.integer :kind, null: false, index: true
      t.references :user, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end

    create_table :items do |t|
      t.references :service, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.integer :status, index: true
      t.text :text
      t.string :image_link, limit: 340

      t.timestamps null: false
    end

    create_table :services do |t|
      t.string :name
      t.string :key, index: true

      t.timestamps null: false
    end

    add_index :services, :key, unique: true

    create_table :events_services, id: false do |t|
      t.belongs_to :event, index: true, foreign_key: true
      t.belongs_to :service, index: true, foreign_key: true
    end
  end
end
