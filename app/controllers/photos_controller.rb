class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end
  
  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new( params[:photo] )
    
    if @photo && @photo.save
      redirect_to user_photos_url(current_user)
    else
      redirect_to new_user_photo_url(current_user)
    end
  end
  
  def show
    @photo = Photo.find_by_id( params[:id] )
  end
  
end
