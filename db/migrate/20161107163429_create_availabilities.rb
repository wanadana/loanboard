class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.date :date
      t.string :timeslot
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
