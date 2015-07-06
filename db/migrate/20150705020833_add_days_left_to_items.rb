class AddDaysLeftToItems < ActiveRecord::Migration
  def change
    add_column :items, :days_left, :integer
  end
end
