require( 'pg' )
require_relative('../db/sql_runner')


class Artist

  attr_reader( :name, :id )

  def initialize( options )
    @id = options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO Artists (name) VALUES ('#{@name}')"
    SqlRunner.run_sql(sql)
    return last_entry
  end

  def last_entry
    sql = "SELECT * FROM Artists ORDER BY id DESC limit 1;"
    return Artist.map_item(sql)
  end 

  def update
    sql = "UPDATE Artists SET name='#{@name}' WHERE id = #{@id}"
    SqlRunner.run_sql(sql)
    return last_entry()
  end

  def self.all
    sql = "SELECT * FROM Artists"
    return Artist.map_items(sql)
  end

  def self.find(id )
    sql = "SELECT * FROM Artists WHERE id = #{id}"
    result = Artist.map_item(sql)
    return result
  end

  def self.delete
    sql = "DELETE FROM Artists WHERE id = '#{id}'"
    SqlRunner.run_sql(sql)
  end

  def self.delete_all
    sql = "DELETE FROM Artists"
    SqlRunner.run_sql(sql)
  end

  def self.map_items(sql)
    artist = SqlRunner.run(sql)
    result = artist.map { |a| Artist.new(artist)}
    return result
  end

  def self.map_item(sql)
    result = Artist.map_items(sql)
    return result.first
  end

end