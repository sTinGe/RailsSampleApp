class SessionsController < ApplicationController
	def new
		
	end
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			# Sign the user in and redirect to the user's show page.
		else
			# Create an eror message and re-render the sign form
			flash[:error] = 'Invalid email/password combination' # Not quite right!
			render 'new'
		end
	end
	def destory
		
	end
end
