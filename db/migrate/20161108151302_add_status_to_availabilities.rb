class AddStatusToAvailabilities < ActiveRecord::Migration[5.0]
  def change
    add_column :availabilities, :status, :string
  end
end
