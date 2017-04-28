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

  def Customer.all()
    sql = "SELECT * FROM customers"
    return Customer.get_many_rows(sql)
  end

  def Customer.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def Customer.get_many_rows(sql)
    customers = SqlRunner.run(sql)
    result = customers.map { |customer| Customer.new(customer)}
    return result
  end

end


