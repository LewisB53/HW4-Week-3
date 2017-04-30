require_relative("../db/sql_runner")

class Screening 

  attr_reader :id
  attr_accessor :film_id, :film_time 

  def initialize( options )
    @id = options['id'].to_i
    @film_id = options['film_id'].to_i
    @film_time = options['film_time']
  end

  def save()
    sql = "INSERT INTO screenings (film_id, film_time) VALUES ('#{ @film_id }', '#{ @film_time }') RETURNING id "
    screenings = SqlRunner.run( sql ).first
    @id = screenings['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM screenings"
    screenings = SqlRunner.run(sql)
    result = self.map_items(sql)
    return result
  end

  def self.delete_all() 
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end


  def self.map_items(sql)
    screenings = SqlRunner.run(sql)
    result = screenings.map { |screenings| Screening.new( screenings ) }
    return result
  end

  def map_items(sql)
    screenings = SqlRunner.run(sql)
    result = screenings.map { |screenings| Screening.new( screenings ) }
    return result
  end

  def most_popular_time
    sql = "SELECT * FROM screenings WHERE film_id =#{@id}"
    screenings = SqlRunner.run(sql)
    result = self.map_items(sql)
    return result.count
  end

end