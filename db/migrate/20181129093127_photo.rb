class Photo < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :name,     null: false, default: ""
      t.string :content,  null: false, default: ""
      t.string :location, null: false, default: ""
      t.timestamp :created_at
    end
  end
end
