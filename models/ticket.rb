require_relative("../db/sql_runner")


class Ticket

  attr_reader :id
  attr_accessor :film_id, :customer_id


  def initialize( options )
    @id = options['id'].to_i
    @film_id = options['film_id'].to_i
    @customer_id = options['customer_id'].to_i
    
  end

  def save()
    sql = "INSERT INTO tickets (film_id, customer_id)
           VALUES ('#{ @film_id }', '#{ @customer_id }') RETURNING id"
    ticket = SqlRunner.run( sql ).first
    @id = ticket['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    result = tickets.map { |ticket| Ticket.new( ticket ) }
    return result
  end

  def self.delete_all() 
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def customer_on_ticket()
    sql = "SELECT * FROM customers WHERE id = #{@customer_id}"
    customer = SqlRunner.run(sql).first
    return Customer.new(customer)
  end

  def film_on_ticket()
    sql = "SELECT * FROM films WHERE id = #{@film_id}"
    film = SqlRunner.run(sql).first
    return Film.new(film)
  end 

  def self.map_items(sql)
    tickets = SqlRunner.run(sql)
    result = tickets.map { |ticket| Ticket.new( ticket ) }
    return result
  end


  def map_items(sql)
    tickets = SqlRunner.run(sql)
    result = tickets.map { |ticket| Ticket.new( ticket ) }
    return result
  end

  def self.count(sql)
    tickets = SqlRunner.run(sql)
    result = tickets{ |ticket| Ticket.new( ticket ) }
    return result
  end

  def charge()
    sql = "UPDATE customers SET funds = (funds - 10) WHERE id = #{@customer_id};"
    tickets = SqlRunner.run(sql)
    result = tickets.map { |ticket| Ticket.new( ticket ) }
    return result
  end



end