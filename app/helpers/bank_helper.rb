module BankHelper

  def bankroll
      bankroll = current_user.contracts.sum(:gain_loss)
  end

end
