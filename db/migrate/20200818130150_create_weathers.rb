class CreateWeathers < ActiveRecord::Migration[6.0]
  def change
    create_table :weathers do |t|
      t.string :city
      t.float :temperature
      t.string :description
      t.integer :humidity

      t.timestamps
    end
  end
end
