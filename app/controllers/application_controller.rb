class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception
	helper_method :sign_in?


	def sign_in?
		!!session[:user_id]
	end

end
 
