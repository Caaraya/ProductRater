class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.boolean :admin
      t.datetime :last_signed_in_at

      t.timestamps null: false
    end
  end
end
