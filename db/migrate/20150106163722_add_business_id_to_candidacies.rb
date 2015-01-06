class AddBusinessIdToCandidacies < ActiveRecord::Migration
  def change
    add_column :candidacies, :business_id, :integer
  end
end


