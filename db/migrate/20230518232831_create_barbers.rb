class CreateBarbers < ActiveRecord::Migration[6.1]
  def change
    create_table :barbers do |t|
      t.string :name
      t.string :shift
      t.string :level

      t.timestamps
    end
  end
end
