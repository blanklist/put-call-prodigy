class ContractsController < ApplicationController
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
      adjusted_time = @contract.created_at - 4.hours
      formatted_time = adjusted_time.change(:sec => 0).strftime("%Y-%m-%d %H:%M:%S")
      price = Asset.get_price(@contract.ticker, formatted_time)
      redirect_to contract_path(contract, :price => price)
    else
      flash[:notice] = "Form is invalid"
      render 'new'
    end
  end

  def show
    @contract = Contract.find(params[:id])
    @price = params[:price]
  end

  private
  def contract_params
    params.require(:contract).permit(:ticker, :strike_price, :interval, :user_id)
  end
end