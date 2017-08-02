class EquitiesController < ApplicationController
	include ContractsHelper
	include BankHelper

	def index
		@user = User.find(session[:user_id])
	end

	def show
		if logged_in?
      @user = current_user
			@equity = Equity.find_by_id(params[:id])
      @contracts = current_user.contracts.order("created_at desc").select{|contract| contract.ticker == @equity.ticker }
			@contract = Contract.new
			@bankroll = bankroll

    else
      redirect_to new_user_path
    end
	end

end
