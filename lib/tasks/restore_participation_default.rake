desc "Reset Participating"

task :reset => :environment do
    users = User.all
    users.each { |user| user.update_attributes(:yes_participating => false)}
end