require( 'pg' )
require_relative('../db/sql_runner.rb')
require_relative('./album.rb')

class Artist

  attr_reader :name, :id

  def initialize( params )
    @id = params['id']
    @name = params['name']
  end

  def save()
    sql = "INSERT INTO Artists (name) VALUES ('#{@name}')"
    SqlRunner.run_sql(sql)
    return last_entry
  end

  def last_entry
    sql = "SELECT * FROM Artists ORDER BY id DESC limit 1"
    return Artist.map_item(sql)
  end 

  def self.update(params)
    sql = "UPDATE Artists SET name='#{params['name']}' WHERE id = #{params['id']}"
    SqlRunner.run_sql(sql)
  end

  def self.all
    sql = "SELECT * FROM Artists"
    return Artist.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM Artists WHERE id=#{id}"
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
    artist = SqlRunner.run_sql(sql)
    result = artist.map { |a| Artist.new(a)}
    return result
  end

  def self.map_item(sql)
    result = Artist.map_items(sql)
    return result.first
  end

end