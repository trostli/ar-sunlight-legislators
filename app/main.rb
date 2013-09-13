require_relative 'models/politician.rb'



# p Politician.find(31).name
Politician.find_senators_by_state('MA')
Politician.find_representatives_by_state('MA')
# Politician.find_all_senators.find_by_state('TX')
# p Politician.find_each_party('R')

Politician.count_sen_by_gender('M')
Politician.count_rep_by_gender('F')

Politician.count_by_state('TX')

Politician.senate_count
Politician.rep_count


 # p Politician.all_active_senators
# p Politician.all_active_senators.count
# p Politician.all.count
