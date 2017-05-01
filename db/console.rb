
require_relative('../models/customer.rb')
require_relative('../models/film.rb')
require_relative('../models/ticket.rb')
require( 'pry-byebug' )

Customer.delete_all
Film.delete_all

customer1 = Customer.new ({'name' => 'Jenny','funds' => 20})
customer2 = Customer.new ({'name' => 'Tommy','funds' => 50})
customer3 = Customer.new ({'name' => 'Lenny','funds' => 10})
customer4 = Customer.new ({'name' => 'Benny','funds' => 100})
customer5 = Customer.new ({'name' => 'Morry','funds' => 20})
customer6 = Customer.new ({'name' => 'Timmy','funds' => 30})
customer1.save
customer2.save
customer3.save
customer4.save
customer5.save
customer6.save

film1 = Film.new ({'title' => 'Beauty and the Beast','price' => 10})
film2 = Film.new ({'title' => 'Shawshank Redemption','price' => 10})
film3 = Film.new ({'title' => 'Gold Finger','price' => 10})
film4 = Film.new ({'title' => 'A Wonderful Life','price' => 10})

film1.save
film2.save
film3.save
film4.save

ticket1 = Ticket.new ({'customer_id'=> customer1.id, 'film_id'=>film2.id})
ticket2 = Ticket.new ({'customer_id'=> customer2.id, 'film_id'=>film2.id})
ticket3 = Ticket.new ({'customer_id'=> customer3.id, 'film_id'=>film1.id})
ticket4 = Ticket.new ({'customer_id'=> customer3.id, 'film_id'=>film2.id})
ticket5 = Ticket.new ({'customer_id'=> customer4.id, 'film_id'=>film4.id})
ticket6 = Ticket.new ({'customer_id'=> customer2.id, 'film_id'=>film3.id})
ticket7 = Ticket.new ({'customer_id'=> customer2.id, 'film_id'=>film4.id})
ticket1.save
ticket2.save
ticket3.save
ticket4.save
ticket5.save
ticket6.save
ticket7.save



binding.pry
nil