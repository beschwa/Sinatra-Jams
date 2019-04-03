require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get ("/") {
  	@allArtists = Artist.all
  	erb :welcome
  }
  get ("/artist/new") {
  	erb :new_artist
  }
  
  get ("/artists/:id") {
  	@artist = Artist.find(params[:id])
  	erb :artist_info
  }


  post ("/artist") {
  	@artist = Artist.new(params[:artist])
  	@artist.save
  	redirect to "artists/#{@artist.id}"
  }

  get ("/artists/:id/edit") {
  	@artist = Artist.find(params[:id])
  	erb :edit_artist
  }

  patch ("/artists/:id") {
  	@artist = Artist.find(params[:id])
  	@artist.update(params[:artist])
  	redirect to "artists/#{@artist.id}"
  }

  delete ("/artists/:id") {
  	@artist = Artist.find(params[:id])
  	@artist.destroy
  	redirect to "/"
  }


end