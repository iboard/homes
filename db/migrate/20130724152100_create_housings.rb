class CreateHousings < ActiveRecord::Migration
  def change
    create_table :housings do |t|
      t.integer :person_id
      t.integer :address_id
      t.string :status

      t.timestamps
    end
  end
end
