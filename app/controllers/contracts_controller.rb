class ContractsController < ApplicationController
  def index
    if logged_in?
      @contracts = current_user.contracts
    else
      redirect_to new_user_path
    end
  end

  def new
    @contract = Contract.new
    # @asset = Asset.search(params[:ticker])
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Form is invalid"
      render 'new'
    end
  end

  def show
    @contracts = current_user.contracts
  end

  private
  def contract_params
    params.require(:contract).permit(:ticker, :strike_price, :interval, :user_id)
  end
end