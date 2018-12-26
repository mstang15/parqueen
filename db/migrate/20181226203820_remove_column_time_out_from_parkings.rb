class RemoveColumnTimeOutFromParkings < ActiveRecord::Migration[5.2]
  def change
    remove_column :parkings, :time_out
  end
end
