class AddColumnsToTables < ActiveRecord::Migration[5.1]
  def change
  	add_column :avia_tours, :meta_description, :string
    add_column :evening_shows, :meta_description, :string
    add_column :land_tours, :meta_description, :string
    add_column :phuket_tours, :meta_description, :string
    add_column :sea_tours, :meta_description, :string
    add_column :boats, :meta_description, :string
    add_column :shops, :meta_description, :string

    add_column :avia_tours, :page_title, :string
    add_column :evening_shows, :page_title, :string
    add_column :land_tours, :page_title, :string
    add_column :phuket_tours, :page_title, :string
    add_column :sea_tours, :page_title, :string
    add_column :boats, :page_title, :string
    add_column :shops, :page_title, :string
  end
end
