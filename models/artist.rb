require('pry-byebug')
require_relative('../db/sql_runner.rb')
require_relative('../models/album.rb')

class Artist


  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i() if options ['id']
  end


  def save()
    sql = "
    INSERT INTO artists
    (name) VALUES ('#{@name}')
    RETURNING id;
    "
    result = SqlRunner.run(sql)
    result_hash = result.first()
    new_id = result_hash['id']
    @id = new_id.to_i()

  end


  def Artist.all()

    sql = "SELECT * FROM artists;"

    result = SqlRunner.run(sql)

    # result_hash = result.first()
    artist_objects = result.map do
      |artist_hash| Artist.new(artist_hash)
    end
    return artist_objects
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = #{@id};"
    result = SqlRunner.run(sql)

  end

  def Artist.delete_all
    sql = "DELETE FROM artists;"
    result = SqlRunner.run(sql)
    
  end



  def update() 
      sql = "
      UPDATE albums SET (name) = 
      ('#{@name}') 
      WHERE id = #{@id}"

      result = SqlRunner.run(sql)
    end

end

