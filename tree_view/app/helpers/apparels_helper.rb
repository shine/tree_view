module ApparelsHelper
	def render_apparel(a, apparel_path_ids)
		render(:partial => 'apparel', :locals => {:apparel => a}) + a.children.select{|c| apparel_path_ids.include?(c.id)}.collect{|c| render_apparel(c, apparel_path_ids)}.join.html_safe
	end
end