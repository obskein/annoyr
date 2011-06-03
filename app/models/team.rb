class Team < ActiveRecord::Base
  has_many :team_members
  has_many :people, :through => :team_members

  require 'calendar'
  def calendar
    Calendar.new open(
    'https://www.google.com/calendar/ical/p83q5k8rgf52f6ifsfq9tlir28%' +
    '40group.calendar.google.com/public/basic.ics'
    )
  end

  def teammates_on_duty
    calendar.teammates_on_duty
  end

  def people_on_call
    @people_on_call ||= teammates_on_duty.map do |teammate|
      Person.find_by_email(teammate).try(:name) || teammate
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
