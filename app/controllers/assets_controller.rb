class AssetsController < ApplicationController
	include ContractsHelper

	def index
		@assets = Asset.all
	end

	def new
		# @contract = Contract.new
		# redirect new_contract_path
	end

	def show
		@contract = Contract.new
    @current_time = Time.now.in_time_zone("Pacific Time (US & Canada)").to_s.split(" ").second
		@asset = Asset.find(params[:id])
		@most_recent_price = Asset.get_price(@asset.ticker, @current_time)
	end

end