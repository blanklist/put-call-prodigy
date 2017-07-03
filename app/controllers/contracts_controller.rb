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
    p params[:contract]
    # ticker = Asset.get_by_ticker(params[:ticker], locals: {ticker => :ticker})
    @contract = Contract.new(contract_params)
    if @contract.save
      Asset.get(@contract.ticker, @contract.created_at.change(:sec => 0).strftime("%Y-%M-%d %H:%M:%S"))
      redirect_to user_path(current_user, locals => {@price => @price})
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