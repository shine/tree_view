class ApparelsController < ApplicationController
  def index
    @roots, @apparel_path_ids = Apparel.search(params[:filter])
  end

  def new
    @apparel = Apparel.new
    @parents = Apparel.select('id, name').all
  end

  def create
    @apparel = Apparel.new(params[:apparel])
    
    if @apparel.save
      redirect_to apparels_path
    else
      @parents = Apparel.select('id, name').all 

      render :action => :new
    end
  end
end