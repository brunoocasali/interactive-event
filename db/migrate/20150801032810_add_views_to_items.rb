class AddViewsToItems < ActiveRecord::Migration
  def change
    add_column :items, :views, :integer, default: 0
  end
end
