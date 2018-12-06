class AddPhotoToUsers < ActiveRecord::Migration[5.1]
  def up
    add_attachment :users, :photos
  end

  def down
    remove_attachment :users, :photos
    
  end
end