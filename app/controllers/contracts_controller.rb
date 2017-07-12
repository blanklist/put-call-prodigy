class ContractsController < ApplicationController
  include ContractsHelper

  def index
    @contracts = current_user.contracts
    #if not logged in, can they get here?
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
      redirect_to asset_path(@contract)
    else
      flash[:notice] = "Form is invalid"
      render 'new'
    end
  end

  def show
    # @contract = Contract.find(params[:id])
    @contract.Contract.new
    @current_time = Time.now.in_time_zone("Pacific Time (US & Canada)").to_s.split(" ").second
  end

  private

  def contract_params
    params.require(:contract).permit(:ticker, :strike_price, :spot_price, :interval, :user_id)
    ## add expiration_date & status?
  end
end
