class WelcomeController < ApplicationController
	def index
		redirect_to equity_path(1)
	end
end
