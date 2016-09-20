class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :mid, null: false
      t.string :payment_type, null: false
      t.string :provider, null: false
      t.string :payout_type, null: false
      t.string :begin_date, null: false
      t.string :end_date, null: false

      t.timestamps null: false
    end

    add_index :settings, [:mid, :payment_type, :provider], unique: true
  end
end
