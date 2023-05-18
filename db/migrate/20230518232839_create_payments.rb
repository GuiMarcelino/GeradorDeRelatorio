class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.decimal :value
      t.references :client, null: false, foreign_key: true
      t.references :barber, null: false, foreign_key: true

      t.timestamps
    end
  end
end
