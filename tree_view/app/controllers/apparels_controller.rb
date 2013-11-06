class ApparelsController < ApplicationController
	def index
		@apparels = if params[:filter]
									Apparel.where("name LIKE ? ", "%"+params[:filter]+"%").all
								else
									Apparel.all
								end
	end
end