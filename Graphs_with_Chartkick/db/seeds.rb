ISO3166::Country.all.shuffle.first(50).each do |country|
  Country.create({name: country.name})
end

100.times { Sporter.create({
                               name: Faker::Name.name,
                               age: rand(18..50),
                               country_id: rand(1..50)
                           }) }

%w(tennis parachuting badminton archery chess boxing racing golf running skiing walking cycling surfing swimming skeleton).each {|c| Competition.create({title: c}) }

Competition.all.each do |competition|
  sporters = Sporter.all.shuffle.first(6)
  (1..6).each do |place|
    CompetitionResult.create({
                                 sporter_id: sporters.pop.id,
                                 competition_id: competition.id,
                                 place: place,
                                 created_at: rand(5.years.ago..Time.now)
                             })
  end
end