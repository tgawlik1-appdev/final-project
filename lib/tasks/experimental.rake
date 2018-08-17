# desc "experiment rake"

# task :experiment => :environment do
#     array = []
#     User.pluck(:network_affiliation).uniq.each do |na|
#       array << User.where(:network_affiliation => na).pluck(:id)
#     end

#     pairs = []
#     array.each do |n|
        
#         n.shuffle
#         if n.size.odd?
#             n.delete(n.sample)
#         end
#         if n.count == 2
#             pairs << n
#         else
#         two_rows = [n[0..n.size/2-1], n[n.size/2..-1]]
#         pairs << two_rows.transpose
#         end
#     end
    
#     matches = pairs.flatten(1)
    
#     matches.each do |pair|
#         Meeting.create(
#             :first_participant => pair[0],
#             :second_participant => pair[1],
#             :first_participant_name => "#{User.find(pair[0]).first_name}, #{User.find(pair[0]).last_name}",
#             :second_participant_name => "#{User.find(pair[1]).first_name}, #{User.find(pair[1]).last_name}",
#             :first_participant_email => User.find(pair[0]).email,
#             :second_participant_email => User.find(pair[1]).email,
#             :meeting_date => Date.today)
#     end
# end