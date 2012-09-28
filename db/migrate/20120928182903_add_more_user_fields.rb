class AddMoreUserFields < ActiveRecord::Migration
  def up
  	add_column :users, :name, :string
  	add_column :users, :birthdate, :date
  	add_column :users, :bio, :text
  end

  def down
  	remove_column :users, :bio
  	remove_column :users, :birthdate
  	remove_column :users, :name
  end
end
