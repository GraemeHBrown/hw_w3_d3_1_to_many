require('pry-byebug')
require_relative('./models/artist.rb')
require_relative('./models/album.rb')

artist1 = Artist.new({'name' => 'Prince'})

artist1.save()

album1 = Album.new({
  'title' => 'Purple Rain',
  'genre' => 'Rock',
  'artist_id' => artist1.id
  })

album2 = Album.new({
  'title' => 'Musicology',
  'genre' => 'Rock',
  'artist_id' => artist1.id
  })

album1.save()
album2.save()

artists = Artist.list_all()

all_albums = Album.list_all()

artist_albums = artist1.list_albums()


binding.pry
nil
