class WelcomeController < ApplicationController
	def index
		redirect users_path
	end
end	