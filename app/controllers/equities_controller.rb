class EquitiesController < ApplicationController
	include ContractsHelper


	def show
		if logged_in?
      @user = current_user
			@equity = Equity.find_by(id: params[:id])
      @contracts = current_user.contracts.order("created_at desc").select{|contract| contract.ticker == @equity.ticker }
			@contract = Contract.new
	    @current_time = Time.now.in_time_zone("Pacific Time (US & Canada)").to_s.split(" ").second

    else
      redirect_to new_user_path
    end
	end


end
