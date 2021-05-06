class UsersController < ApplicationController
	layout 'lay'
	def signup
	end
	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			if user.role == 'teacher'
				redirect_to '/dashboard'
			else
				redirect_to '/studashboard'
			end
		else
			flash[:register_errors] = user.errors.full_messages
			redirect_to '/'
		end

	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
		end
end
