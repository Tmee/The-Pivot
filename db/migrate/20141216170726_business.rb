class Business < ActiveRecord::Migration
  def change
    create_table :business do |t|
      t.string :name
      t.string :address
      t.text :description
    end
  end
end
