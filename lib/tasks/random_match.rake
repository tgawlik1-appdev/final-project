desc "Random Matching"

task :random => :environment do
    ids = User.all.pluck(:id)
    n = ids.shuffle
    if n.size.odd?
        n.delete(n.sample)
    end
    two_rows = [n[0..n.size/2-1], n[n.size/2..-1]]
    pairs = two_rows.transpose.shuffle
    pairs.each do |pair|
        Meeting.create(:first_participant => pair[0], :second_participant => pair[1], :meeting_date => Date.today)
    end
end
    
 
