module ApparelsHelper
	def render_apparel a
		if a.is_root?
			render :partial => 'apparel', :locals => {:apparel => a}	
		else
			render_apparel(a.parent) + render(:partial => 'apparel', :locals => {:apparel => a})
		end
	end
end