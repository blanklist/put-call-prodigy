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
      today_date = Time.now.strftime("%Y-%m-%d")
      p purchase_time
      p today_date + " 15:59:00"
      if purchase_time > today_date + " 15:59:00" || Date.today.saturday? || Date.today.sunday?
        puts "here"
        spot_price = Equity.get_price(@contract.ticker)
      else
        puts "there"
        spot_price = Equity.get_price(@contract.ticker, purchase_time)
      end
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
    @contract.Contract.new

  end

  private

  def contract_params
    params.require(:contract).permit(:ticker, :strike_price, :spot_price, :interval, :gain_loss, :expiration_date, :status, :put_call, :user_id, :equity_id)
  end
end
