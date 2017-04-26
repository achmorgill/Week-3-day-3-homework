require('pry-byebug')
# require_relative('../models/album')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

Album.delete_all()
# Artist.delete_all()

artist1 = Artist.new({'name' => 'Elton John'})
artist2 = Artist.new({'name' => 'Elkie Brooks'})
artist3 = Artist.new({'name' => 'Adele'})

artist1.save()
artist2.save()
artist3.save()

album1 = Album.new({'title' => 'Why Worry',
        'genre' => 'pop',
        'artist_id' => artist1.id
        })
album2 = Album.new({'title' => 'Ruby is Fab',
        'genre' => 'rap',
        'artist_id' => artist2.id
        })
album3 = Album.new({'title' => 'No Homework Thursdays',
        'genre' => 'pop',
        'artist_id' => artist2.id
        })


album1.save()
album2.save()
album3.save()

binding.pry
nil
