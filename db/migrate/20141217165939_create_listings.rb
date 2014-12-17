class CreateListings < ActiveRecord::Migration
  def change
     create_table :listings do |t|
      t.integer :business_id
      t.integer :wage
      t.integer :hours
      t.integer :number_of_positions
      t.string  :title
      t.string  :end_date
      t.text    :description

      t.timestamps
    end
  end
end
