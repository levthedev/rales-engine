class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.decimal :unit_price
      t.timestamp :created_at
      t.timestamp :updated_at
      t.references :merchant, index: true, foreign_key: true
    end
  end
end
