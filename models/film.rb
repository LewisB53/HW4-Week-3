require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title
  attr_accessor :price

  def initialize( options )
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i

  end

  def save()
    sql = "INSERT INTO films (title, price) 
    VALUES ('#{ @title }','#{ @price }') RETURNING id"
    film = SqlRunner.run( sql ).first
    @id = film['id'].to_i
  end


  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    result = self.map_items(sql)
    return result
  end

  def self.delete_all() 
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end


  def self.map_items(sql)
    films = SqlRunner.run(sql)
    result = films.map { |film| Film.new( film ) }
    return result
  end

  def map_items(sql)
    films = SqlRunner.run(sql)
    result = films.map { |film| Film.new( film ) }
    return result
  end

  def watched_by_how_many
  sql = "SELECT * FROM tickets WHERE #{@id} = film_id"
  result = self.map_items(sql)
  return result.count
  end

end