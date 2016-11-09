class AddPhotoToBoard < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :photo, :string
  end
end
