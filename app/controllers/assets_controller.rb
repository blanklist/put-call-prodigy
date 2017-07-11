class AssetsController < ApplicationController
	include ContractsHelper




	def show
		if logged_in?
      @user = current_user
      @contracts = current_user.contracts
			## needs to be currentasset.contracts
    else
      redirect_to new_user_path
    end
	end


	def update

	end


	def delete

	end



	# def show
	# 	@contract = Contract.new
  #   @current_time = Time.now.in_time_zone("Pacific Time (US & Canada)").to_s.split(" ").second
	# 	@asset = Asset.find(params[:id])
	# 	@most_recent_price = Asset.get_price(@asset.ticker, @current_time)
	# end

end

# Assets/asset_id/contracts = creation of a contract with asset.id
# assets#index -- not needed
# assets#new -- not needed

# def show
# 	@contract = Contract.new
# 	@current_time = Time.now.in_time_zone("Pacific Time (US & Canada)").to_s.split(" ").second
# 	@asset = Asset.find(params[:id])
# 	@most_recent_price = Asset.get_price(@asset.ticker, @current_time)
# end
