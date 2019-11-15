class CreateHealths < ActiveRecord::Migration[5.2]
  def change
    create_table :healths do |t|
      t.string :name 
      t.integer :date 
    end 
  end
end
