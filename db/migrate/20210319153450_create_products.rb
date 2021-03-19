class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.column(:name, :string)
      t.column(:cost, :decimal, precision: 6, scale: 2)
      t.column(:country_of_origin, :string)
      
      t.timestamps
    end
  end
end
