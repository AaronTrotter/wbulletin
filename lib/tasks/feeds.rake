namespace :feeds do

  desc "Update all feeds in the database"
  task :update => :environment do
    Feed.update_all!
  end

end