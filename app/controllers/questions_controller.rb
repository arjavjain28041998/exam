class QuestionsController < ApplicationController
	before_action :authenticate_user
	def authenticate_user
		unless User.find_by(id: session[:user_id])
			redirect_to '/'
		end

	end
	def create
		que = Question.new(que_params)
		if que.save
			redirect_to '/dashboard'
		else
			redirect_to '/add'
		end
	end
	private
		def que_params
			params.permit(:subject, :question, :answer)
		end 
end
