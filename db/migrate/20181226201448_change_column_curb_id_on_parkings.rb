class ChangeColumnCurbIdOnParkings < ActiveRecord::Migration[5.2]
  def change
    change_column :parkings, :curb_id, :string, index: true
  end
end
