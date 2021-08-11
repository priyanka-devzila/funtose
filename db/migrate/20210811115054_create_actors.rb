class CreateActors < ActiveRecord::Migration[6.1]
  def change
    create_table :actors do |t|
      t.string :first_name 
      t.string :last_name
      t.string :nationality
      t.date :date_of_birth
      

      t.timestamps
    end
  end
end
