require( 'pg' )
require_relative('../db/sql_runner.rb')
require_relative('album.rb')
require_relative('artist.rb')

class Stock

  attr_reader :album_id, :quantity, :id


  def initialize( params )
    @id = params['id']
    @album_id = params['album_id']
    @quantity = params['quantity']
  end

  def save
    sql = "INSERT INTO Stocked (album_id, qunatity) VALUES ('#{@album_id}', '#{@quantity}')"
    SqlRunner.run_sql(sql)
    return last_entry()
  end

  def last_entry
    sql = "SELECT * FROM Stocked ORDER BY id DESC limit 1"
    return Stock.map_item(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM Stocked WHERE id = #{id}"
    result = SqlRunner.run_sql(sql)
    return result
  end

  def self.all()
    sql = "SELECT * FROM Stocked"
    return Stock.map_items(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM Stocked WHERE id = #{id}"
    SqlRunner.run_sql(sql)
  end

  def self.delete_all
    sql = "DELETE FROM Stocked"
    SqlRunner.run_sql(sql)
  end

  def self.map_item(sql)
    result = Stock.map_items(sql)
    return result.first
  end

  def self.map_items(sql)
    stock = SqlRunner.run_sql(sql)
    result = stock.map { |s| Stock.new( s ) }
    return result
  end
end