class CreatePhlogs < ActiveRecord::Migration
  def change
    create_table :phlogs do |t|
      t.string :name
      t.integer :gallery_id

      t.timestamps
    end
  end
end
