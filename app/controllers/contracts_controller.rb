class ContractsController < ApplicationController
  include ContractsHelper

  def index
    if logged_in?
      @user = current_user
      @contracts = current_user.contracts
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
      purchase_time = purchase_time_adjustment(@contract.created_at)
      spot_price = Asset.get_price(@contract.ticker, purchase_time)
      @contract.update_attributes(:spot_price => spot_price)
      redirect_to contract_path(@contract)
    else
      flash[:notice] = "Form is invalid"
      render 'new'
    end
  end

  def show
    @contract = Contract.find(params[:id])
  end

  private
  def contract_params
    params.require(:contract).permit(:ticker, :strike_price, :spot_price, :interval, :user_id)
  end
end