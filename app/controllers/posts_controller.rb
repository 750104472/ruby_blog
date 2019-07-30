class PostsController < ApplicationController
	def index
		@posts = if params[:category]
			Post.where(category_id: params[:category])
		else
			Post.all
		end

	end
end
 