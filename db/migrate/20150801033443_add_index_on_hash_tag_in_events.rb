class AddIndexOnHashTagInEvents < ActiveRecord::Migration
  def change
    add_index :events, :hash_tag
  end
end
