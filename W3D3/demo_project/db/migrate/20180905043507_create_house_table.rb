class CreateHouseTable < ActiveRecord::Migration[5.2]
  def change
    create_table :house_tables do |t|
      t.timestamp
      t.string :address
    end
  end
end

#ActiveRecord::Migration[5.2]
