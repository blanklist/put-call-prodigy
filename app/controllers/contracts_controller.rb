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
      purchase_time = alpha_time_adjustment(@contract.created_at)
      if markets_open?
        spot_price = Equity.get_price(@contract.ticker, purchase_time)
      else
        spot_price = Equity.get_price(@contract.ticker)
      end
      @equity = Equity.find(params[:equity_id])
      @contract.update_attributes(:spot_price => spot_price)
      if markets_open?
        CalculateGainLossJob.set(wait_until: @contract.expiration).perform_later @contract, current_user
      else
        gain_loss = 0
        @contract.update_attributes(:gain_loss => gain_loss)
      end
      redirect_to equity_path(@equity)
    else
      flash[:notice] = "Form is invalid"
      render 'show'
    end
  end

  def show
    @contract.Contract.new

  end

  private

  def contract_params
    params.require(:contract).permit(:ticker, :strike_price, :spot_price, :interval, :gain_loss, :expiration_date, :status, :put_call, :user_id, :equity_id)
  end
end
