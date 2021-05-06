class SessionsController < ApplicationController
def create
		user = User.find_by(email:login_params[:email])
		if user && user.authenticate(login_params[:password])
			session[:user_id] = user.id
			if user.role == 'teacher'
				redirect_to '/dashboard'
			else
				redirect_to '/studashboard'
			end
		else
			flash[:login_errors] = ['invalid creditinals']
			redirect_to '/'
		end
	end
	def destroy
    	User.find(session[:user_id])   
    	session[:user_id] = nil         
    	redirect_to '/' 
  end 
	private
		def login_params
			params.require(:login).permit(:email, :password)
		end
end
