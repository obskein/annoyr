require 'pp'
require 'open-uri'
require 'rubygems'
require 'icalendar'

class Calendar
  def initialize stream
    @cals = Icalendar.parse stream
  end

  def teammates_on_duty
    todays_events = @cals.first.events.find_all do |event|
      event.dtstart == Date.today
    end

    todays_events.map do |event|
      event.properties['description']
    end
  end
end

# USAGE:
#
# cals = open(
#   'https://www.google.com/calendar/ical/p83q5k8rgf52f6ifsfq9tlir28%' +
#   '40group.calendar.google.com/public/basic.ics'
# )
#
# # or....
#
# cals = open("#{File.dirname(__FILE__)}/calendar.ics")
# 
# calendar = Calendar.new cals
# 
# pp calendar.teammates_on_duty
