class AddEmailAddressAndTwitterNameToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :email, :string
    add_column :people, :twitter_screen_name, :string
  end

  def self.down
    remove_column :people, :twitter_screen_name
    remove_column :people, :email
  end
end
