class AssetsController < ApplicationController
	include ContractsHelper

	def index
		@assets = Asset.all
	end

	def show
		@asset = Asset.find(params[:id])
		@most_recent_price = Asset.get_price(@asset.ticker, "2017-07-08 07:30:00")
	end

end