class FollowsController < ApplicationController
  before_filter :require_current_user!, :only => [:create, :destroy]
  
  def create
    @follow = Follow.new(params[:follow])
    
    puts params
    
    if @follow && @follow.save
      render :json => @follow
    else
      render :json => "Failure".to_json
    end
  end
  
  def destroy
    @follow = Follow.find_by_id(params[:id])
    
    if @follow && @follow.destroy
      render :json => @follow
    else
      render :json => "Failure".to_json
    end
  end
  
end
