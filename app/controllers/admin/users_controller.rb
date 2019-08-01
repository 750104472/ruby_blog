class Admin::UsersController < Admin::BaseController
	# skip_before_action :authenticate, only: [:new, :create]
	def index
		@users = User.all.order("created_at desc")
	end

	def new
		@user = User.new
	end

	def create
		@user =User.new(user_params)
		if @user.save
			sign_in @user
			redirect_to admin_users_path
		else
			render "new"
		end
	end

	def edit
		@user = User.find(params[:id])
	end
	
	def update
		@user = User.find(params[:id])
		@user.assign_attributes(user_params)
		if @user.save
			redirect_to admin_users_path
		else
			render 'edit'
		end

	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to admin_users_path
	end

	private
	def user_params
		params.require(:user).permit(:email, :nickname, :password, :password_confirmation)
	end

end
