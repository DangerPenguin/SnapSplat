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
      redirect_to photos_url
    else
      redirect_to new_photo_url
    end
  end
  
  def show
    @photo = Photo.find_by_id( params[:id] )
  end
  
end
