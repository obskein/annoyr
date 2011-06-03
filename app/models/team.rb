class Team < ActiveRecord::Base
  has_many :team_members
  has_many :people, :through => :team_members

  def annoy!
  end

  def self.annoy_all!
    Teams.all.each do |team|
      team.annoy!
    end
  end
end
