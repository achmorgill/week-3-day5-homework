require_relative('../db/sqlrunner.rb')

class Ticket


    attr_reader :id
    attr_accessor :customer_id, :film_id

    def initialize(options)
      @customer_id = options['customer_id']
      @film_id = options['film_id']
      @id = options['id'].to_i

    end

    def delete()
      sql = "DELETE FROM tickets WHERE id = #{@id}"
      SqlRunner.run(sql)
    end

    def save()
      sql = "INSERT INTO tickets (customer_id, film_id) VALUES ('#{@customer_id}', '#{@film_id}') RETURNING *"
      result = SqlRunner.run(sql).first
      @id = result['id'].to_i
      return @id
    end

    def Ticket.delete_all()
      sql = "DELETE FROM tickets"
      SqlRunner.run(sql)
    end

    def Ticket.all()
      sql = "SELECT * FROM tickets"
      # result = SqlRunner.run(sql)
      return Ticket.get_many_rows(sql)
      # result = tickets.map {|ticket| Ticket.new(ticket)}
      return result
    end

    def Ticket.get_many_rows(sql)
    
      tickets = SqlRunner.run(sql)
      result = tickets.map { |ticket| Ticket.new(Ticket)}
      return result
    end


end