class AddStatusToAvailability < ActiveRecord::Migration[5.0]
  def change
    add_column :availabilities, :status, :boolean
  end
end
