require( 'pg' )
require_relative('../db/sql_runner.rb')


class Album

  attr_reader :id, :title, :artist_id

  def initialize( params )
    @id = params['id']
    @title = params['title']
    @artist_id = params['artist_id']
  end

  def save()
    sql = "INSERT INTO Albums (title, artist_id) VALUES ('#{@title}', '#{@artist_id}')"
    SqlRunner.run_sql(sql)
    return last_entry
  end

  def last_entry()
    sql = "SELECT * FROM Albums ORDER BY id DESC limit 1"
    return Album.map_item(sql)
  end

  def update()
    sql = "UPDATE Albums SET title = '#{@title}', artist_id = #{@artist_id} WHERE id = #{@id}"
    SqlRunner.run_sql(sql)
    return last_entry
  end

  def self.find(id)
    sql = "SELECT * FROM Albums WHERE id = #{id}"
    result = Album.map_item(sql)
    return result
  end

  def self.delete(id)
    sql = "DELETE FROM Albums WHERE id = #{id}"
    SqlRunner.run_sql(sql)
  end

  def self.delete_all
    sql = "DELETE FROM Albums"
    SqlRunner.run_sql(sql)
  end

  def self.all()
    sql = "SELECT * FROM Albums"
    return Album.map_items(sql)
  end

  def self.map_item(sql)
    result = Album.map_items(sql)
    return result.first    
  end

  def self.map_items(sql)
    album = SqlRunner.run_sql(sql)
    result = album.map { |album| Album.new(album)}    
  end

end