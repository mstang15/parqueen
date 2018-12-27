class AddColumnCurbIdToParkings < ActiveRecord::Migration[5.2]
  def change
    add_column :parkings, :curb_id, :string, index: true
  end
end
