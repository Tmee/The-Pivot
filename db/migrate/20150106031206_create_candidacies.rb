class CreateCandidacies < ActiveRecord::Migration
  def change
    create_table :candidacies do |t|
      t.integer :user_id
      t.integer :listing_id
      t.string  :status, default: "pending"


      t.timestamps
    end
  end
end


