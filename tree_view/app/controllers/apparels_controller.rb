class ApparelsController < ApplicationController
	def index
		apparels =  if params[:filter]
									Apparel.select('id, ancestry').where("name LIKE ? ", "%"+params[:filter]+"%").all
		  					else
									Apparel.select('id, ancestry').all
								end

		@apparel_path_ids = apparels.inject([]){|arr, item| arr|item.path_ids} # ids of nodes need to be shown
		@roots = Apparel.where(:ancestry => nil).where(:id => @apparel_path_ids).all
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