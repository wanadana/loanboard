class AddBookedByAndBookedOnToAvailability < ActiveRecord::Migration[5.0]
  def change
    add_column :availabilities, :booked_by, :integer
    add_column :availabilities, :booked_on, :datetime
  end
end
