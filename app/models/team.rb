class Team < ActiveRecord::Base
  has_many :team_members
  has_many :people, :through => :team_members

  def annoy!
    puts "Annoyed #{name}!"
  end

  def self.annoy_all!
    Team.all.each do |team|
      team.annoy!
    end
  end
end
