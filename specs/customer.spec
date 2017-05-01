
require_relative ('../models/customer.rb')
require_relative ('../models/film.rb')
require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')

class CustomerTest < Minitest::Test

  def setup

    @movie1 = Film.new ({'title' => 'Beauty and the Beast','price' => 10})
    @customer1 = Customer.new ({'name' => 'Tommy','funds' => 20})
  end

  def test_buy_a_ticket()
    @customer1.buy_a_ticket(@movie1.title)
    assert_equal(10,@customer1.funds)
  end

  def tests_how_many_tickets_bought()
  tickets_bought = @customer1.how_many_tickets_bought()
  assert_equal(3,tickets_bought)
  end


end
