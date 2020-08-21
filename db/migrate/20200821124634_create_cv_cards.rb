class CreateCvCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cv_cards do |t|
      t.string :business
      t.string :job
      t.date :date
      t.string :competence

      t.timestamps
    end
  end
end
