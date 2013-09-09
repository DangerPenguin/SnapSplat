class HomesController < ApplicationController
  before_filter :require_current_user!, :only => [:show]
  
  def show
  end
  
end
