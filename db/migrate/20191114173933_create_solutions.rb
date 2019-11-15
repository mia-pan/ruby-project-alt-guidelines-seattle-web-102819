class CreateSolutions < ActiveRecord::Migration[5.2]
  def change
    create_table :solutions do |t|
      t.integer :user_id 
      t.integer :health_id 
      t.string :self_help
      t.string :community
    end 

  end
end
