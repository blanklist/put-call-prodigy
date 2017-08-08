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
      @latest_price = Equity.get_price(@equity.ticker)
      @contracts = current_user.contracts.order("created_at asc").select{|contract| contract.ticker == @equity.ticker }
  	  @contract = Contract.new
  	  @bankroll = bankroll
    else
      redirect_to new_user_path
    end
  end

end
