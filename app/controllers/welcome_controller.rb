class WelcomeController < ApplicationController
	def index
		redirect_to contracts_path
	end
end	