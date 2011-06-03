class CalendersArePerTeamNotGlobal < ActiveRecord::Migration
  def self.up
    add_column :teams, :calendar_url, :string
  end

  def self.down
    remove_column :teams, :calendar_url
  end
end
