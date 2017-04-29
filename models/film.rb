require_relative('../db/sqlrunner.rb')

class Film


    attr_reader :id
    attr_accessor :title, :price

    def initialize(options)
      @title = options['title']
      @price = options['price']
      @id = options['id'].to_i
    end

    def save()
      sql = "INSERT INTO films (title, price) VALUES ('#{@title}', '#{@price}') RETURNING *"
      result = SqlRunner.run(sql).first
      @id = result['id'].to_i
      return @id
    end

    def delete()
      sql = "DELETE FROM films WHERE id = #{@id}"
      SqlRunner.run(sql)
    end

    def update()
      sql = "UPDATE films SET (title
      ,price) = ('#{@title}','#{@price}') WHERE id = #{@id}"
      SqlRunner.run(sql)

    end

    def Film.all()
      sql = "SELECT * FROM films"
      result = Film.get_many_rows(sql)
      # films = SqlRunner.run(sql).first
      # result = films.map {|film| Film.new(films)}
      return result
    end

    def Film.delete_all()
      sql = "DELETE FROM films"
      SqlRunner.run(sql)
    end

    def Film.get_many_rows(sql)
      films = SqlRunner.run(sql)
      result = films.map { |film| Film.new(film)}
      return result
    end

    def customers()
      sql = "SELECT customers.* FROM customers, tickets WHERE tickets.customer_id = customers.id and tickets.film_id = #{@id}"
      customer = SqlRunner.run(sql)
      result = customer.map {|name| Customer.new(name)}
      return result
    end


end