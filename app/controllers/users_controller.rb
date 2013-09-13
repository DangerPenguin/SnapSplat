class UsersController < ApplicationController
  before_filter :require_current_user!, :only => [:show, :index, :edit, :update]
  before_filter :require_no_current_user!, :only => [:create, :new]
  
  respond_to :html, :json
  
  def create
    @user = User.new(params[:user])
    
    if @user && @user.save
      self.current_user = @user
      redirect_to user_home_url(@user)
    else
      render :json => @user.errors.full_messages
    end
  end
  
  def new
    @user = User.new
  end
  
  def show
    if params.include?(:id)
      @user = User.find(params[:id])
    else
      redirect_to user_url(current_user)
    end
  end
  
  def index
    @users = User.all
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    
    respond_to do |format|
      format.html do
        if @user.update_attributes(params[:user]) && @user.save
          redirect_to user_url(current_user)
        else
          redirect_to edit_user_url(current_user)
        end
      end
      
      format.json do
        if @user.update_attributes(params[:user]) && @user.save
          render :json => @user.photos.find_by_id( @user.profile_picture_id).url.to_json
        else
          render :json => "Failure"
        end
      end
    end



    
  end
  
end
