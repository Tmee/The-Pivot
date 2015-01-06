class AddLetterToBusinessToCandidacies < ActiveRecord::Migration
  def change
    add_column :candidacies, :letter_to_business, :text
  end
end
