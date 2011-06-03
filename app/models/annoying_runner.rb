require 'rufus/scheduler'

class AnnoyingRunner
  def self.start!
    EM.run do
      scheduler = Rufus::Scheduler.start_new

      tick!
      scheduler.cron '0 7 * * *' do
        # every day at 7:00am
        tick!
      end
        
      scheduler.every '1s' do
      end
    end
  end

  def self.tick!
    puts 'whos on call!?'
    Team.annoy_all!
  end
end
