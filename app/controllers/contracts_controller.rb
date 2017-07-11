class ContractsController < ApplicationController
  include ContractsHelper

  def index
    if logged_in?
      @user = current_user
      @contracts = current_user.contracts
      # GetStockPriceJob.perform_later "TSLA"
    else
      redirect_to new_user_path
    end
  end

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      purchase_time = alpha_time_adjustment(@contract.created_at)
      spot_price = Asset.get_price(@contract.ticker, purchase_time)
      @contract.update_attributes(:spot_price => spot_price)
      redirect_to contracts_path(@contract)
    else
      flash[:notice] = "Form is invalid"
      render 'new'
    end
  end

  def show
    @contract = Contract.find(params[:id])
    @current_time = Time.now.in_time_zone("Pacific Time (US & Canada)").to_s.split(" ").second
  end

  private
  def contract_params
    params.require(:contract).permit(:ticker, :strike_price, :spot_price, :interval, :user_id)
  end
end