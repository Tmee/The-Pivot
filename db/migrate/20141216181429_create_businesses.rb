class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.integer :id
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :slug
      t.string :url
      t.text :description
      t.timestamps
    end
  end
end
