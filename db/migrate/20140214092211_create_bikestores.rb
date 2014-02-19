class CreateBikestores < ActiveRecord::Migration
  def change
    create_table :bikestores do |t|
      t.boolean :checked
      t.integer :accuracy
      t.string :state
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :phone
      t.string :zipcode

      t.timestamps
    end
  end
end
