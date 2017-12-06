require('pry-byebug')
require_relative('./models/artist.rb')
require_relative('./models/album.rb')
Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => 'Prince'})
artist2 = Artist.new({'name' => 'Morrisey'})
artist1.save()
artist2.save()

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

  album3 = Album.new({
    'title' => 'Sign O The Times',
    'genre' => 'Rock',
    'artist_id' => artist1.id
    })

album1.save()
album2.save()
album3.save()

all_artists = Artist.list_all()

all_albums = Album.list_all()

artist_albums = artist1.list_albums()

artist_for_album = album1.list_artist()

artist2.name = 'Mozza'
artist2.update()

album2.genre = '?'
album2.update()

artist2.delete()

album3.delete()

artist = Artist.find_by_id(artist1.id)
album = Album.find_by_id(album2.id)
binding.pry
nil
