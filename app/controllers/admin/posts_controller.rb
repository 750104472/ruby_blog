class Admin::PostsController < Admin::BaseController
	# skip_before_action :verify_authenticity_token
	def index
		@page_number = 10
		@posts = current_user.posts.paginate(page: params[:page], :per_page => @page_number)
	end


	def new	
		@post = Post.new
	end	

	def create
		@post = current_user.posts.new(post_params)

		if @post.save
			redirect_to admin_root_path
		else
			render 'new'
		end
	end


	def edit
		@post = Post.find(params[:id])
	end


	def update
		@post = Post.find(params[:id])
		@post.assign_attributes(post_params)
		if @post.save
			redirect_to admin_root_path
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to admin_root_path
	end

	private

		def post_params
			params.require(:post).permit(:category_id, :title, :author, :content, :published_at)
		end

end