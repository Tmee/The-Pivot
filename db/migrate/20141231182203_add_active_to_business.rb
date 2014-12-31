class AddActiveToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :active, :boolean
  end
end
