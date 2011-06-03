class Person < ActiveRecord::Base
  validates :email, :presence => true
  validates :twitter_screen_name, :presence => true

  has_many :team_members
  has_many :teams, :through => :team_members

end
