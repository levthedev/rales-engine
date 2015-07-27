class AddTimestampsToUser < ActiveRecord::Migration
  def change
    add_column :customers, :created_at, :timestamp
    add_column :customers, :updated_at, :timestamp
  end
end
