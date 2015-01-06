class RemoveBusinessIdFromCandidacies < ActiveRecord::Migration
  def change
    remove_column :candidacies, :business_id
  end
end
