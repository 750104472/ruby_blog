class PostsController < ApplicationController
	def index
		@page_number
		@posts = if params[:category]
			Post.where(category_id: params[:category]).paginate(page: params[:page], :per_page => @page_number)
		else
			Post.all.paginate(page: params[:page], :per_page => 3)
		end

	end

	def show
		@post = Post.find(params[:id])
	end
end
 