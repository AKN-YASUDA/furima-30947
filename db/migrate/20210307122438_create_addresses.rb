class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :purchasing,            foreign_key: true
      t.string :postcode,                  null: false
      t.integer :prefecture_id,            null: false
      t.string :town,                      null: false
      t.string :house_number,              null: false
      t.string :building_name
      t.string :phone,                     null: false
      t.timestamps
    end
  end
end
