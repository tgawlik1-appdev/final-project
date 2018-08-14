desc "Reset Participating"

task :reset => :environment do
    users = User.all
    users.each do |user|
        if user.yes_participating == true
            user.yes_participating = false
        end
    end
end