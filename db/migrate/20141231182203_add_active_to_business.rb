class AddActiveToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :active, :boolean, default: false
  end
end
