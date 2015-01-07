class CreateCandidacies < ActiveRecord::Migration
  def change
    create_table :candidacies do |t|
      t.integer :user_id, null: false
      t.integer :listing_id, null: false
      t.integer :business_id, null: false
      t.string  :status, default: "pending", null: false
      t.text    :letter_to_business, default: ""

      t.timestamps
    end
  end
end
