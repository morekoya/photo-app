class AdjustPhotos < ActiveRecord::Migration[5.2]
  def change
    remove_column :photos, :content, :string
    remove_column :photos, :location, :string
    add_column :photos, :user_id, :integer
    
  end
end
