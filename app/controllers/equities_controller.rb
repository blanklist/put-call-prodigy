class EquitiesController < ApplicationController
	include ContractsHelper

	def show
		if logged_in?
      @user = current_user
			@equity = Equity.find_by(id: params[:id])
      @contracts = current_user.contracts.order("created_at desc").select{|contract| contract.ticker == @equity.ticker }
			gain_loss = current_user.contracts.sum(:gain_loss)
			@contract = Contract.new

    else
      redirect_to new_user_path
    end
	end

end
