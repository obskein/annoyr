desc 'Worker for scraping and pinging the output sources'
namespace :wf do
  task :runner => :environment do
    AnnoyingRunner.start!
  end
end

