class AssetsController < ApplicationController
	include ContractsHelper

	def create
		@asset = Asset.new
		### how are we going to use this? Won't be a form post.
	end


	def show
		if logged_in?
      @user = current_user
      @contracts = current_user.contracts
			@contract = Contract.new
	    @current_time = Time.now.in_time_zone("Pacific Time (US & Canada)").to_s.split(" ").second
			@asset = Asset.find_by(id: params[:id])
    else
      redirect_to new_user_path
    end
	end


	def update

	end


	def delete
		Asset.delete(:id)

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
