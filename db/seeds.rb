# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   mayor.create(name: 'emanuel', city: cities.first)
#

josh   = User.create({email: 'jdjkelly@gmail.com', password: '123', is_premium: true})
cailen = User.create({email: 'cailen.mac@gmail.com', password: '123', is_premium: true})

josh_tracker   = Tracker.create({name: 'button-tracker', user_id: josh.id})
cailen_tracker = Tracker.create({name: 'button-tracker', user_id: cailen.id})

user_agents = [
  'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5',
  'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36',
  'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:37.0) Gecko/20100101 Firefox/37.0'
]

ip_addresses = %w(67.46.19.27
                229.228.143.100
                230.198.75.28
                15.166.196.91
                54.54.252.189
                91.174.118.185
                23.222.59.160
                194.126.109.7
                171.127.34.146
                100.177.245.75
                120.66.103.135
                231.44.226.31)

[josh_tracker, cailen_tracker].each do |tracker|
  100.times do
    date = Time.now - rand(30).days
    Conversion.create({user_agent: user_agents.sample, ip_address: ip_addresses.sample, tracker_id: tracker.id, created_at: date})
  end
end
