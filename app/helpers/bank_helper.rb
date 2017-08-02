module BankHelper

  def bankroll
      bankroll = current_user.contracts.sum(:gain_loss)
  end

  def dollar_plus_decimal(num)
    numarr = num.to_s.split('.')
    dec = numarr.count > 1 ? numarr[1].ljust(2,'0') : "00"
    "$ #{numarr[0]}.#{dec}"
  end

end
