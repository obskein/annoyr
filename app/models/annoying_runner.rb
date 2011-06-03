require 'rufus/scheduler'

class AnnoyingRunner
  def self.start!
    EM.run do
      scheduler = Rufus::Scheduler.start_new

      tick!
      # scheduler.cron '0 7 * * *' do
      scheduler.every '1m' do

        # every day at 7:00am
        tick!
      end
        
    end
  end

  def self.tick!
    Team.annoy_all!
    # don't run out of db connections
    ActiveRecord::Base.clear_reloadable_connections! 
  end
end
