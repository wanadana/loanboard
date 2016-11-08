class RemoveStatusFromAvailability < ActiveRecord::Migration[5.0]
  def change
    remove_column :availabilities, :status, :boolean
  end
end
