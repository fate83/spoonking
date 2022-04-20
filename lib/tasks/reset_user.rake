desc '...'
task :reset_users, [:email] => :environment do |task, args|
  puts "Resetting User #{args[:email]}..."
  user = User.find_by_email!(args[:email])
  user.reset!
end
