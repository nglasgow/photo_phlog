class AddPictureProcessedToPhlogs < ActiveRecord::Migration
  def change
    add_column :phlogs, :picture_processed, :boolean
  end
end
