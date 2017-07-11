class WelcomeController < ApplicationController
	def index
		redirect_to assets_path
	end
end
