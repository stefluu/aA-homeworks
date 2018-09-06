class CreatePersonTable < ActiveRecord::Migration[5.2]
  def change
    create_table :person do |t|
      t.string :name, null: false
      t.integer :house_id
      t.timestamp
    end

    rename_table :person, :people
  end

end
