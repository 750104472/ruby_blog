module ApplicationHelper
	#分页后，index值控制
	def show_index(index, per_page)
	    params[:page] ||= 1
	    (params[:page].to_i - 1) * per_page + index + 1
	end
end
