class CreateGlobalAccountSettings < ActiveRecord::Migration
  def self.up
    create_table :global_account_settings do |t|
      t.string :twitter_request_token
      t.string :twitter_request_token_secret

      t.timestamps
    end
  end

  def self.down
    drop_table :global_account_settings
  end
end
