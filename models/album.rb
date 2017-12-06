require_relative('../db/sql_runner.rb')
require_relative('artist.rb')

class Album

  attr_reader :id, :artist_id
  attr_accessor :title, :genre

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (
    title,
    genre,
    artist_id
    ) VALUES (
      $1, $2, $3
      ) RETURNING *
      ;"
      values = [@title, @genre, @artist_id]
      result = SqlRunner.run(sql, values)
      @id = result[0]['id'].to_i
    end

  def Album.list_all()
    sql = "SELECT * FROM albums;"
    results = SqlRunner.run(sql)
    return results.map{|album| Album.new(album)}
  end

  def list_artist()
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [@artist_id]
    results_array = SqlRunner.run(sql, values)
    artist_hash = results_array[0]
    artist = Artist.new(artist_hash)
    return artist
  end

  def update()
    sql = "UPDATE albums SET (
            title,
            genre,
            artist_id
            ) = (
              $1, $2, $3
            ) WHERE id = $4"
    values = [@title, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def Album.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM albums
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  end
