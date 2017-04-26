
require_relative('../db/sql_runner.rb')
require_relative('../models/artist.rb')

class Album


  attr_accessor :title, :genre
  attr_reader :artist_id, :id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i() if options ['id']
    @artist_id = options['artist_id'].to_i() if options['artist_id']
  end

  def save()
    sql = "
    INSERT INTO albums
    (title,genre,artist_id) VALUES ('#{@title}', '#{genre}', #{artist_id})
    RETURNING id;
    "
    result = SqlRunner.run(sql)
    result_hash = result.first()
    new_id = result_hash['id']
    @id = new_id.to_i()

  end


  def Album.all()

    sql = "SELECT * FROM albums;"

    result = SqlRunner.run(sql)
    album_objects = result.map do
      |album_hash| Album.new(album_hash)
    end
    return album_objects
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = #{@id};"
    result = SqlRunner.run(sql)

  end

  def Album.delete_all()
    sql = "DELETE FROM albums;"
    result = SqlRunner.run(sql)
  end

  def update() 
    sql = "
    UPDATE albums SET (
      title,
      genre,
      artist_id
    ) = (
      '#{@title}',
      '#{@genre}','
      '#{@artist_id}' )
    WHERE id = #{@id}"

    result = SqlRunner.run(sql)
  end

  


end

