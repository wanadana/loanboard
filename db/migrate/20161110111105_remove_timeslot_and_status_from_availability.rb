class RemoveTimeslotAndStatusFromAvailability < ActiveRecord::Migration[5.0]
  def change
    remove_column :availabilities, :timeslot, :string
    remove_column :availabilities, :status, :string
  end
end
