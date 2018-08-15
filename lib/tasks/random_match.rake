desc "Random Matching"

task :random => :environment do
    ids = User.all.pluck(:id, :network_affiliation)
    sort_ids = ids.sort {|a,b| a[1] <=> b[1]}
    network_affiliation_array = []
    network_arrays = sort_ids.chunk {|x| x[1] == x[1]}.each do |array|
        network_affiliation_array.push(array)
    end
    
        
    
    
    
    n = ids.shuffle
    if n.size.odd?
        n.delete(n.sample)
    end
    two_rows = [n[0..n.size/2-1], n[n.size/2..-1]]
    pairs = two_rows.transpose.shuffle
    pairs.each do |pair|
        Meeting.create(
            :first_participant => pair[0],
            :second_participant => pair[1],
            :first_participant_name => User.find(pair[0]).first_name + User.find(pair[0]).last_name,
            :second_participant_name => User.find(pair[1]).first_name + User.find(pair[1]).last_name,
            :first_participant_email => User.find(pair[0]).email,
            :second_participant_email => User.find(pair[1]).email,
            :meeting_date => Date.today)
    end
end
    
 
