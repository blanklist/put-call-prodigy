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
    p "within contracts new" + params
    @contract = Contract.new
    # @asset = Asset.find(params[:id])
  end


  def create
    p "made it to contract create"
    @contract = Contract.new(contract_params)
    if @contract.save
      purchase_time = alpha_time_adjustment(@contract.created_at)
      spot_price = Equity.get_price(@contract.ticker, purchase_time)
      @equity = Equity.find(params[:equity_id])
      @contract.update_attributes(:spot_price => spot_price)
      CalculateGainLossJob.set(wait_until: @contract.expiration).perform_later @contract
      redirect_to equity_path(@equity)
    else
      flash[:notice] = "Form is invalid"
      render 'show'
    end
  end

  def show
    # @contract = Contract.find(params[:id])
    @contract.Contract.new
  
  end

  private

  def contract_params
    params.require(:contract).permit(:ticker, :strike_price, :spot_price, :interval, :user_id, :equity_id)
    ## add expiration_date & status?
  end
end
