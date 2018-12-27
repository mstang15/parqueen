class CreateParkings < ActiveRecord::Migration[5.2]
  def change
    create_table   :parkings do |t|
      t.point      :coord
      t.time       :time_out
      t.string     :street_name
      t.string     :start_cross_street
      t.string     :end_cross_street
      t.string     :side_of_street
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
