require_relative("../db/sql_runner")

class Customer 

  attr_reader :id
  attr_accessor :name, :funds 

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{ @name }', '#{ @funds }') RETURNING id"
    customer = SqlRunner.run( sql ).first
    @id = customer['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = self.map_items(sql)
    return result
  end

  def self.delete_all() 
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def films_watched()
    sql = "SELECT films.* FROM films 
          INNER JOIN tickets ON tickets.film_id = films.id 
          WHERE customer_id = #{@id};"
    films = SqlRunner.run(sql)
    result = self.map_items(sql)
    return result.count
  end

  def self.map_items(sql)
    customers = SqlRunner.run(sql)
    result = customers.map { |customer| Customer.new( customer ) }
    return result
  end

  def map_items(sql)
    customers = SqlRunner.run(sql)
    result = customers.map { |customer| Customer.new( customer ) }
    return result
  end

  def count_tickets_bought
  sql = "SELECT * FROM tickets WHERE #{@id} = customer_id"
  result = self.map_items(sql)
  return result.count
  end

end