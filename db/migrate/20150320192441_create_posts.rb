class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
	  t.references :user
      t.text :description
      t.string :name
      t.string :photo_url
      t.integer :rating

      t.timestamps null: false
    end
  end
end
