class CreateUsers < ActiveRecord::Migration[5.2]
  def change 
    create_table :users do |t|
      t.integer :age
      t.string :name 
      t.string :background 
    end 
  end
end
