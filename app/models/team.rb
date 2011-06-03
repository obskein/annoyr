class Team < ActiveRecord::Base
  has_many :team_members
  has_many :people, :through => :team_members
end
