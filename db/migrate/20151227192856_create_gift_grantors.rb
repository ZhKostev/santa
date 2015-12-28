class CreateGiftGrantors < ActiveRecord::Migration
  def change
    create_table :gift_grantors do |t|
      t.string :grantor
      t.string :recipient

      t.timestamps null: false
    end
  end
end
