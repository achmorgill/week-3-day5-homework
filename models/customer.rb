require_relative('../db/sqlrunner.rb')


class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @name = options['name']
    @funds = options['funds']
    @id = options['id'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', '#{@funds}') RETURNING *"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
    return @id
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE customers SET (name,funds) = ('#{@name}','#{@funds}') WHERE id = #{@id}"
    SqlRunner.run(sql)

  end

  def Customer.all()
    sql = "SELECT * FROM customers"
    return Customer.get_many_rows(sql)
  end

  def Customer.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def films()
    sql = "SELECT films.* FROM films, tickets WHERE tickets.film_id = films.id and tickets.customer_id = #{@id}"
    film = SqlRunner.run(sql)
    result = film.map {|title| Film.new(title)}
    return result
  end

  def Customer.get_many_rows(sql)
    customers = SqlRunner.run(sql)
    result = customers.map { |customer| Customer.new(customer)}
    return result
  end

  def buy_a_ticket(movie_title)
  
    sql = "SELECT price FROM films
    WHERE title = '#{movie_title}'"

    result = SqlRunner.run(sql).first
    price = result['price'].to_i
    film = result['film']
    @funds = @funds - price
    sql = "UPDATE customers SET (price) VALUES ('#{@funds}' WHERE film = '#{film}')"
puts "+++++++++++++#{sql}"
result = SqlRunner.run(sql)
    return price
  end

  def how_many_tickets_bought()
   
   result = films()

    return result.count
  end

end


