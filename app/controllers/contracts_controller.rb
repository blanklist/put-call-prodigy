class ContractsController < ApplicationController
  include ContractsHelper

  def index
    @contracts = current_user.contracts
    #if not logged in, can they get here?
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
      @contract.update_attributes(:spot_price => spot_price)
      redirect_to equity_path(@contract)
    else
      flash[:notice] = "Form is invalid"
      render 'show'
    end
  end

  def show
    # @contract = Contract.find(params[:id])
    @contract.Contract.new
    @current_time = Time.now.in_time_zone("Pacific Time (US & Canada)").to_s.split(" ").second
  end

  private

  def contract_params
    params.require(:contract).permit(:ticker, :strike_price, :spot_price, :interval, :user_id, :equity_id)
    ## add expiration_date & status?
  end
end
