require_relative( '../models/film' )
require_relative( '../models/customer' )
require_relative( '../models/ticket' )
require_relative( '../models/screening' )

require( 'pry-byebug' )

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()
Screening.delete_all()

film1 = Film.new({ 'title' => 'Fast n Furious 34', 'price' => 10})
film1.save()
film2 = Film.new({ 'title' => 'Ice Age 24 (3D)' , 'price' => 12})
film2.save()

customer1 = Customer.new({ 'name' => 'Lewis', 'funds' => 20})
customer1.save()
customer2 = Customer.new({ 'name' => 'Bob', 'funds' => 40})
customer2.save()

ticket1 = Ticket.new({ 'film_id' => film1.id, 'customer_id' => customer1.id})
ticket1.save()
ticket2 = Ticket.new({ 'film_id' => film2.id, 'customer_id' => customer1.id})
ticket2.save()
ticket3 = Ticket.new({ 'film_id' => film1.id, 'customer_id' => customer2.id})
ticket3.save()

screening1 = Screening.new({ 'film_id' => film1.id, 'film_time' => 1800})
screening1.save()
screening2 = Screening.new({ 'film_id' => film1.id, 'film_time' => 2000})
screening1.save()

binding.pry
nil