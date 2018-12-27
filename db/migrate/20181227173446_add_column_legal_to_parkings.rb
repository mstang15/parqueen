class AddColumnLegalToParkings < ActiveRecord::Migration[5.2]
  def change
    add_column :parkings, :legal, :boolean
  end
end
