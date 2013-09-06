class AddPictureToPhlogs < ActiveRecord::Migration
  def change
    add_column :phlogs, :picture, :string
  end
end
