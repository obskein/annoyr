require 'calendar'

class Team < ActiveRecord::Base
  has_many :team_members
  has_many :people, :through => :team_members

  validates :name, :presence => true
  validates :calendar_url, :presence => true

  def calendar
    Calendar.new open(calendar_url.to_s.strip)
  rescue Exception => e
    nil
  end

  def teammates_on_duty
    calendar.try(:teammates_on_duty) || []
  end

  def people_on_call
    @people_on_call ||= teammates_on_duty.map do |email|
      person = Person.find_by_email(email)
      person ? "@#{person.twitter_screen_name}" : email
    end
  end

  def annoy_time
    Time.now.to_s(:short)[1..-1] if Time.now.to_s(:short) =~ /^0/
  end

  def annoying_message
    is_or_are = people_on_call.size > 1 ? "are" : "is"
    "#{people_on_call.to_sentence} #{is_or_are} on call for #{name} on #{annoy_time}!"
  end

  def annoy!

    Rails.logger.debug annoying_message
    TwitterInterface.tweet! annoying_message
  end

  def self.annoy_all!
    Team.all.each do |team|
      team.annoy!
    end
  end
end
